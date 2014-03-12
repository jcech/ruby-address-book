class PhoneNumber
  def PhoneNumber.create(type, number)
    new_number = PhoneNumber.new(type, number)
    new_number
  end

  def initialize(type, number)
    @number = number.gsub(/(\d{3})[^\d]?(\d{3})[^\d]?(\d{4})/, '(\1)\2-\3')
    @type = type
  end

  def number
    @number
  end

  def type
    @type
  end
end

# PhoneNumber.create("cell", '5064567890')

