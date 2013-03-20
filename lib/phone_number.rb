class PhoneNumber
  attr_reader :number

  def initialize(number)
    @number = number.gsub(/[^\d]/,'')
  end

  def valid?
    @number.length == 10
  end
end