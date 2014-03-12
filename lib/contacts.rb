class Contact
  @@all_contacts = []
  def Contact.create(first, last)
    name = "#{first} #{last}"
    new_contact = Contact.new(name)
    @first_name = first
    @last_name = last
    @@all_contacts << new_contact
    new_contact
  end

  def initialize(name)
    @name = name
    @first_name = ""
    @last_name = ""
    @address = []
    @phone_numbers = []
    @email = []
  end

  def Contact.all
    @@all_contacts
  end

  def save
    @@all_contacts << self  # this methods is covered in the create method
  end                       # and is not currently being used.

  def Contact.clear
    @@all_contacts = []
  end

  def name
    @name
  end

  def last_name
    @last_name
  end

  def first_name
    @first_name
  end

  def address
    @address
  end

  def phone_numbers
    @phone_numbers
  end

  def add_phone_number(number)
    @phone_numbers << number
  end

  def email
    @email
  end
end
