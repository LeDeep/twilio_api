require 'spec_helper'

describe PhoneNumber do 

  context 'validations' do
    it 'checks that phone number is 10 digits' do 
      phone_number = PhoneNumber.new('916-444-5555')
      phone_number.valid?.should be_true
    end

  end  



end