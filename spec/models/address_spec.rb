require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:contact) { FactoryGirl.create(:contact) }

  describe 'Validations' do
    it { should validate_presence_of(:door_no) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:pincode) }
    it { should validate_length_of(:door_no).is_at_least(2) }
    it { should validate_length_of(:door_no).is_at_most(10) }
    it { should validate_length_of(:city).is_at_least(2) }
    it { should validate_length_of(:city).is_at_most(20) }
    it { should validate_length_of(:state).is_at_least(2) }
    it { should validate_length_of(:state).is_at_most(20) }
    it { should validate_length_of(:pincode).is_at_least(2) }
    it { should validate_length_of(:pincode).is_at_most(10) }

    it 'has a valid address' do
      expect(FactoryGirl.build(:address, contact: contact)).to be_valid
    end

    it 'is invalid without door no' do
      expect(FactoryGirl.build(:address, door_no: nil, contact: contact)).not_to be_valid
    end

    it 'is invalid without street' do
      expect(FactoryGirl.build(:address, street: nil, contact: contact)).not_to be_valid
    end

    it 'is invalid without city' do
      expect(FactoryGirl.build(:address, city: nil, contact: contact)).not_to be_valid
    end

    it 'is invalid without state' do
      expect(FactoryGirl.build(:address, state: nil, contact: contact)).not_to be_valid
    end

    it 'is invalid without pincode' do
      expect(FactoryGirl.build(:address, pincode: nil, contact: contact)).not_to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:contact) }

    it 'display address with format' do
      address = FactoryGirl.build(:address, contact: contact)
      expect(address.format).not_to be_empty
    end
  end
end

