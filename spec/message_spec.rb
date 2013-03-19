require 'spec_helper'

describe Message do 

  context '#valid?' do 
    it "should verify that a sms message has a maximum of 160 characters" do
      message = Message.new('160 characters' * 100)
      message.valid?.should be_false
    end
  end
end