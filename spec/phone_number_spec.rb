require 'spec_helper'

describe PhoneNumber do 

  context 'validations' do
    it 'checks that phone number is 10 digits' do 
      phone_number = PhoneNumber.new('916-444-5555')
      phone_number.valid?.should be_true
    end

  

    #it {should validate_presence_of :number}
    # it {should allow_value('916-432-1234').for (:number)}
    # it {should_not allow_value('444-323-123').for (:number)}

  end  



end