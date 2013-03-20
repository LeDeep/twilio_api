require 'spec_helper'

describe Message do 

  context '#valid?' do 
    it "should verify that a sms message has a maximum of 160 characters" do
      message = Message.new('160 characters' * 100)
      message.valid?.should be_false
    end
  end

    context 'initialize' do 
      it 'should an initialize with an argument for message' do 
      Message.new('hello').should be_an_instance_of Message
    end
  end

    context 'attr_readers' do
      it 'returns the message of an SMS ' do
        content = Message.new('stuff')
        content.content.should eq 'stuff'
      end
    end



end