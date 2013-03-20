require 'faraday'
require 'rspec'
require 'json'
require 'base64'
require 'webmock/rspec'
require 'sms'
require 'phone_number'
require 'message'


TEST_ACCOUNT_SID = 'AC19be48dc7ef9350bf49b8fc1598650ca'
TEST_AUTH_TOKEN = '515ae2ce41f03a6b5a1f8f7565776da6'
FROM_NUMBER = '+19162264348'


JSON_VALID_POST =  "{\"sid\":\"SM207aac2b1946df083d91cae5bc11335e\",\"date_created\":\"Tue, 19 Mar 2013 22:05:38 +0000\",\"date_updated\":\"Tue, 19 Mar 2013 22:05:38 +0000\",\"date_sent\":null,\"account_sid\":\"ACcacd3ee8f71f0df754c0155135fbd703\",\"to\":\"+16307768158\",\"from\":\"+15005550006\",\"body\":\"asjdkaskksa\",\"status\":\"queued\",\"direction\":\"outbound-api\",\"api_version\":\"2010-04-01\",\"price\":null,\"uri\":\"/2010-04-01/Accounts/ACcacd3ee8f71f0df754c0155135fbd703/SMS/Messages/SM207aac2b1946df083d91cae5bc11335e.json\"}" 
JSON_INVALID_POST = "{\"status\":400,\"message\":\"The From phone number provided is not a valid, SMS-capable inbound phone number or short code for your account.\",\"code\":21606,\"more_info\":\"http://www.twilio.com/docs/errors/21606\"}" 