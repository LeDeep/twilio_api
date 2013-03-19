class PhoneNumber
  attr_reader :number

  def initialize(number)
    @number = number.gsub(/[^\d]/,'')
  end

  def valid?
    @number.gsub(/[^\d]/,'').length == 10
  end
end