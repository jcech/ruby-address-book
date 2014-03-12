require './lib/contacts'
require './lib/phone_numbers'

def prompt
  print '>'
end

def main_menu
  puts "\n\n"
  puts "Create contact (press C)"
  if Contact.all.length > 0
    puts "List contacts (press L)"
  end
  puts "Exit from address book (Press X)"
  prompt
  option = gets.chomp.upcase

    case option

    when "C"
      make_new_contact
    when "X"
      puts "Goodbye!"

    when "L"
      show_contacts
      puts "choose a contact number to see contact details"
      prompt
        user_input = gets.chomp.to_i
        if user_input.between?(1,Contact.all.length)
          details(user_input)
          add_details(user_input)
        else
          puts "Not a valid contact"
        end
      main_menu
    else
      puts "That is not a valid input"
      main_menu
    end
end

def make_new_contact
  puts "Enter your contact's first name"
  first = gets.chomp.capitalize
  puts "Enter your contact's last name"
  last = gets.chomp.capitalize
  Contact.create(first, last)
  puts "#{Contact.all.last.name} was created in contacts"
  main_menu
end

def show_contacts
  Contact.all.each_with_index do |contact, order|
    puts "#{order+1}: #{contact.name}"
  end
end
def details(user_input)
    this = Contact.all[user_input-1]
    puts this.name
    this.phone_numbers.each do |phone|
      puts "#{phone.type}: #{phone.number}"
    end
end
def add_details(user_input)
  this = Contact.all[user_input-1]
  puts "Add a phone number (Press P)"
  puts "Press X to go back to contact details"
  list_option = gets.chomp.upcase
    case list_option

    when "P"
    puts "Enter the type of Phone Number"
    type = gets.chomp
    puts "enter your 10 digit phone number"
    number = gets.chomp
    this.add_phone_number(PhoneNumber.create(type, number))
    puts "Added: #{this.phone_numbers.last.type} #{this.phone_numbers.last.number}"
    add_details(user_input)
    when "X"
      details(user_input)
    end
end
main_menu
