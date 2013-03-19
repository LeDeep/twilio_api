class Twilio
  require 'faraday'
  require 'base64'

  attr_reader :status, :message

  def initialize
    @status = nil
    @message = nil
  end

  def sms(to_number, message,from_number)
    post_response = Faraday.post do |request|
      request.url "https://api.twilio.com/2010-04-01/Accounts/#{TEST_ACCOUNT_SID}/SMS/Messages.json"
      request.headers['Authorization'] = "Basic " + Base64.strict_encode64("#{TEST_ACCOUNT_SID}:#{TEST_AUTH_TOKEN}")
      request.body = URI.encode_www_form({'From' => "#{from_number}", 'To' => "#{to_number}", 'Body' => "#{message}"})
    end
    response_body = JSON.parse(post_response.body)
    if response_body["status"].to_i >= 400
      @message = response_body["message"]
      false
    else
      @message = "Your message has been sent."
      true
    end
  end



end