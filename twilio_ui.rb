def welcome
  puts "Welcome to the Epicodus text message sender."
  puts "Enter your Twilio username: "
  $twilio_username = gets.chomp
  puts "Enter your Twilio password: "
  $twilio_password = gets.chomp
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
    message = message_body  
    numbers = []
    until choice == 'x'
      puts "Please enter a number you want to SMS (example: 916-123-4567) press 'x' when finished: "
      number = PhoneNumber.new(gets.chomp)
      if number.valid?
        numbers << number
      else
        puts "Invalid!"
      end
    end

end

def message_body
  puts "Please enter the message you would like to send (up to 160):"
  message = Message.new(gets.chomp)
  unless message.valid?
    #validation error code from ActiveModel
    puts "Invalid"
    message_body
  else
    message
  end
end 
  
