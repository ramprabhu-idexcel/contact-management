require 'rails_helper'

RSpec.describe Phone, type: :model do
  let(:contact) { FactoryGirl.create(:contact) }

  describe 'Validations' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:type_of) }
    it { should validate_length_of(:number).is_at_least(5) }
    it { should validate_length_of(:number).is_at_most(20) }
    it { should allow_value('Mobile','Fax','LandLine').for(:type_of) }
    it { should_not allow_value('test').for(:type_of) }

    it 'has a valid factory' do
      expect(FactoryGirl.build(:phone, contact: contact)).to be_valid
    end

    it 'is invalid without phone number' do
      expect(FactoryGirl.build(:phone, number: nil, contact: contact)).not_to be_valid
    end

    it 'is invalid without phone type' do
      expect(FactoryGirl.build(:phone, type_of: nil, contact: contact)).not_to be_valid
    end

    it 'is invalid with number length' do
      expect(FactoryGirl.build(:phone, number: '111111-111111111-111111111', contact: contact)).not_to be_valid
    end

    it 'is invalid phone number format' do
      expect(FactoryGirl.build(:phone, number: '--333---555---77', contact: contact)).not_to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:contact) }
  end
end
