require 'rails_helper'

RSpec.describe Phone, type: :model do
  let(:contact) { FactoryGirl.create(:contact) }

  describe 'Validations' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:type_of) }

    it 'has a valid factory' do
      expect(FactoryGirl.build(:phone, contact: contact)).to be_valid
    end

    it 'is invalid without phone number' do
      expect(FactoryGirl.build(:phone, number: nil, contact: contact)).not_to be_valid
    end

    it 'is invalid without phone type' do
      expect(FactoryGirl.build(:phone, type_of: nil, contact: contact)).not_to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:contact) }
  end
end
