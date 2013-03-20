require 'spec_helper'

describe PhoneNumber do 


  context 'validations' do
    it 'checks that phone number is 10 digits' do 
      phone_number = PhoneNumber.new('916-444-5555')
      phone_number.valid?.should be_true
    end

  end  


  context 'initialize' do 
      it 'should an initialize with an argument for number' do 
      PhoneNumber.new('916-343-3434').should be_an_instance_of PhoneNumber
    end
  end

  context 'attr_readers' do
      it 'returns the number an SMS is being sent to ' do
        number = PhoneNumber.new('13124504610')
        number.number.should eq '13124504610'
      end
    end




end