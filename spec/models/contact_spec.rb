require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:type) }
    it { should_not allow_value("blah").for(:email) }
    it { should allow_value("a@b.com").for(:email) }
    it { should validate_numericality_of(:age) }
    it { should allow_value(50).for(:age) }
    it { should_not allow_value(-50).for(:age) }
    it { should allow_value('Business','Personal').for(:type) }
    it { should_not allow_value('Bus').for(:type) }

    it 'has a valid contact' do
      expect(FactoryGirl.build(:contact)).to be_valid
    end

    it 'is invalid without first name' do
      contact = FactoryGirl.build(:contact, first_name: nil)
      expect(contact).not_to be_valid
    end

    it 'is invalid without last name' do
      contact = FactoryGirl.build(:contact, last_name: nil)
      expect(contact).not_to be_valid
    end

    it 'is invalid without email' do
      contact = FactoryGirl.build(:contact, email: nil)
      expect(contact).not_to be_valid
    end

    it 'is invalid email' do
      contact = FactoryGirl.build(:contact, email: 'blah')
      expect(contact).not_to be_valid
    end

    it 'is invalid without contact type' do
      contact = FactoryGirl.build(:contact, type: nil)
      expect(contact).not_to be_valid
    end

    it 'is uniqueness of email' do
      FactoryGirl.create(:contact, email: 'person@example.in')
      contact = FactoryGirl.build(:contact, email: 'person@example.in')
      expect(contact).not_to be_valid
    end

    it 'is check full name' do
      contact = FactoryGirl.create(:contact, first_name: 'raj', last_name: 'kumar')
      expect(contact.name).to eq('raj kumar')
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:addresses) }
    it { is_expected.to have_many(:phones) }

    it 'is valid addresses' do
      contact = FactoryGirl.create(:contact, :with_addresses)
      expect(contact.all_addresses).not_to be_empty
    end

    it 'is valid phones' do
      contact = FactoryGirl.create(:contact, :with_phones)
      expect(contact.all_phones).not_to be_empty
    end
  end
end
