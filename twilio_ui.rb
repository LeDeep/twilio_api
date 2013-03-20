require './lib/phone_number'
require './lib/message'
require './lib/sms'
require 'json'
require 'base64'

TEST_ACCOUNT_SID = 'AC19be48dc7ef9350bf49b8fc1598650ca'
TEST_AUTH_TOKEN = '515ae2ce41f03a6b5a1f8f7565776da6'
FROM_NUMBER = '+19162264348'

def welcome
  puts "Welcome to the Epicodus text message sender."
  # puts "Enter your Sms username: "
  # $sms_username = gets.chomp
  # puts "Enter your Sms password: "
  # $sms_password = gets.chomp
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
    client = Sms.new
    numbers.each do |phone|
      client.send_message(phone.number, message.content, FROM_NUMBER)
      puts client.message
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
  if message.valid?
    message
  else
    puts "Invalid"
    get_message_body
  end
end 
  
welcome