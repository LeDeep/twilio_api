require 'spec_helper'

describe Twilio do 

  context '#sms' do 
    it 'sends message to a phone number from a twilio assigned phone number' do 
      stub = stub_request(:post, "https://ACcacd3ee8f71f0df754c0155135fbd703:78065a09051d03ca60815ef4d5b5bc78@api.twilio.com/2010-04-01/Accounts/ACcacd3ee8f71f0df754c0155135fbd703/SMS/Messages.json").
         with(:body => {"Body"=>"how much would you pay for a pony?", "From"=>"+15005550006", "To"=>"13124504610"},
              :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Faraday v0.8.6'}).
         to_return(:status => 200, :body => JSON_VALID_POST, :headers => {})
      twilio = Twilio.new
      twilio.sms('13124504610', 'how much would you pay for a pony?', FROM_NUMBER)
      stub.should have_been_requested
    end

    it 'returns true if a send is successful' do
      stub = stub_request(:post, "https://ACcacd3ee8f71f0df754c0155135fbd703:78065a09051d03ca60815ef4d5b5bc78@api.twilio.com/2010-04-01/Accounts/ACcacd3ee8f71f0df754c0155135fbd703/SMS/Messages.json").
         with(:body => {"Body"=>"how much would you pay for a pony?", "From"=>"+15005550006", "To"=>"13124504610"},
              :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Faraday v0.8.6'}).
         to_return(:status => 200, :body => JSON_VALID_POST, :headers => {})
      twilio = Twilio.new
      twilio.sms('13124504610', 'how much would you pay for a pony?', FROM_NUMBER).should be_true
    end

    it 'returns false if a send is unsuccessful' do
       stub = stub_request(:post, "https://ACcacd3ee8f71f0df754c0155135fbd703:78065a09051d03ca60815ef4d5b5bc78@api.twilio.com/2010-04-01/Accounts/ACcacd3ee8f71f0df754c0155135fbd703/SMS/Messages.json").
         with(:body => {"Body"=>"how much would you pay for a pony?", "From"=>"+15005550006", "To"=>"13124504610"},
              :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Faraday v0.8.6'}).
         to_return(:status => 200, :body => JSON_INVALID_POST, :headers => {})
      twilio = Twilio.new
      twilio.sms('13124504610', 'how much would you pay for a pony?', FROM_NUMBER).should be_false
    end
  end


end