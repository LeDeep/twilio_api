class PhoneNumber

  def initialize(number)
    @number = number
  end

  def valid?
    @number.split('-').join('').length == 10
  end
end