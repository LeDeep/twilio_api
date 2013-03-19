require './lib/phone_number'
require './lib/message'
require './lib/twilio'
require 'json'
require 'base64'

TEST_ACCOUNT_SID = 'ACcacd3ee8f71f0df754c0155135fbd703'
TEST_AUTH_TOKEN = '78065a09051d03ca60815ef4d5b5bc78'
FROM_NUMBER = '+15005550006'

def welcome
  puts "Welcome to the Epicodus text message sender."
  # puts "Enter your Twilio username: "
  # $twilio_username = gets.chomp
  # puts "Enter your Twilio password: "
  # $twilio_password = gets.chomp
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Press 's' to select numbers and send an SMS."
    puts "Press 'x' to exit."

    case choice = gets.chomp
    when 's'
      sms
    when 'x'
      exit
    else
      invalid
    end
  end
end

def sms
  message = get_message_body  
  numbers = get_numbers
  puts "Here is the message your are sending: #{message.content}"
  puts "Your message has been sent to the following recipients:"
  numbers.each { |phone| puts "   #{phone.number}"}
  puts "Are you sure you would like to send the above message to the above numbers? (y/n)"
  if gets.chomp.downcase == 'y'
    client = Twilio.new
    numbers.each do |phone|
      if client.sms(phone.number,message.content,FROM_NUMBER)
        puts client.message
      else
        puts client.message
      end
    end
  end

end

def get_numbers
    numbers = []
    choice = nil
    until choice == 'x'
      puts "Please enter a number you want to SMS (example: 916-123-4567) press 'x' when finished: "
      choice = gets.chomp
      next if choice == 'x'
      number = PhoneNumber.new(choice)
      if number.valid?
        puts "Number #{number.number} has been added your SMS list."
        numbers << number
      else
        puts "Invalid!"
      end
    end
    numbers
end

def get_message_body
  puts "Please enter the message you would like to send (up to 160):"
  message = Message.new(gets.chomp)
  unless message.valid?
    puts "Invalid"
    message_body
  else
    message
  end
end 
  
welcome