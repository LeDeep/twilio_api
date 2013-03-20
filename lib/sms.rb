class Sms
  require 'faraday'
  require 'base64'

  attr_reader :status, :message

  def initialize
    @status = nil
    @message = nil
  end

  def send_message(to_number, message,from_number)
    post_response = Faraday.post do |request|
      request.url "https://api.twilio.com/2010-04-01/Accounts/#{TEST_ACCOUNT_SID}/SMS/Messages.json"
      request.headers['Authorization'] = "Basic " + Base64.strict_encode64("#{TEST_ACCOUNT_SID}:#{TEST_AUTH_TOKEN}")
      request.body = URI.encode_www_form({'From' => "#{from_number}", 'To' => "#{to_number}", 'Body' => "#{message}"})
    end
    response_body = JSON.parse(post_response.body)
    if post_response.status >= 400
      @message = response_body["message"]
      @status = post_response.status
      false
    else
      @message = "Your message has been sent."
      @status = post_response.status
      true
    end
  end



end