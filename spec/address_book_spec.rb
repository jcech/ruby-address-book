require 'contacts'
require 'phone_numbers'
require 'rspec'

describe Contact do
  before do
    Contact.clear
  end
  it 'should initilize a class instance' do
    test_contact = Contact.new('name')
    test_contact.should be_an_instance_of Contact
  end
  it 'should initialize a new contact with a name' do
    test_contact = Contact.new('Bob')
    test_contact.name.should eq 'Bob'
  end
  it 'should initialze a new contact with a first name' do
    test_contact = Contact.new('Bob')
    test_contact.first_name.should eq ""
  end
  it 'should initialze a new contact with a last name' do
    test_contact = Contact.new('Bob')
    test_contact.last_name.should eq ""
  end

  it 'should initialze a new contact with a phone number' do
    test_contact = Contact.new('Bob')
    test_contact.phone_numbers.should eq []
  end
  it 'should initialze a new contact with a email' do
    test_contact = Contact.new('Bob')
    test_contact.email.should eq []
  end
  describe '.create' do
    it 'makes a new instance of Contact' do
      test_contact = Contact.create('Bob', 'Vance')
      test_contact.should be_an_instance_of Contact
    end
  end
  describe '.all' do
    it 'makes an empty array of all contacts' do
      Contact.all.should eq []
    end
  end
  describe '#save' do
    it 'adds a contact to the array of saved contacts' do
      test_contact = Contact.create('Bob', 'Vance')
      # test_contact.save
      Contact.all.should eq [test_contact]
    end
  end
  describe '.clear' do
    it 'clears out the all_contacts array' do
      Contact.create('Bob', 'Vance')
      Contact.clear
      Contact.all.should eq []
    end
  end
  describe '.last' do
    it 'should return the last contact' do
      Contact.create('Dylan', 'Thomas')
      Contact.create( 'Bob', 'Dylan')
      Contact.all.last.name.should eq ('Bob Dylan')
    end
  end
  describe 'add_phone_number' do
    it 'should add a new instance of phone number to phone number array' do
      test_contact = Contact.create('Bob', 'Dylan')
      test_number = PhoneNumber.create('cell', '5035467890')
      test_contact.add_phone_number(test_number)
      test_contact.phone_numbers.should eq [test_number]
    end
  end
end


describe PhoneNumber do
   it 'should initilize a phone number instance' do
    test_number = PhoneNumber.new("cell", "5034564689")
    test_number.should be_an_instance_of PhoneNumber
  end
  it 'should initialize a new PhoneNumber with a number with the proper format' do
    test_number = PhoneNumber.new('cell','9072994728')
    test_number.number.should eq '(907)299-4728'
  end
  describe '.create' do
    it 'makes a new instance of PhoneNumber' do
      test_number = PhoneNumber.create('cell', '5066584590')
      test_number.should be_an_instance_of PhoneNumber
    end
  end
end






