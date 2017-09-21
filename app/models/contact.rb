class Contact < ApplicationRecord
  attr_accessor :all_addresses, :all_phones
  has_many :addresses, dependent: :destroy
  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :addresses

  validates :name, :email, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def all_addresses
    address = ''
    addresses.pluck(:door_no,:street,:landmark,:city,:pincode,:state).each do |add|
      address << add.compact.to_sentence << '\n'
    end
    address
  end

  def all_phones
    phones.pluck(:number).join(",")
  end
end
