class Contact < ApplicationRecord
  TYPE = %w(Business Personal)
  self.inheritance_column = 'type'
  has_many :addresses, dependent: :destroy
  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :addresses

  validates :first_name, :last_name, :email, :type, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_uniqueness_of :email, :if => Proc.new{|f| f.email.present? }

  def all_addresses
    address = ''
    addresses.each.each do |addr|
      address << addr.format << '\n'
    end
    address
  end

  def all_phones
    phones.pluck(:number).join(",")
  end

  def name
    "#{first_name} #{last_name}"
  end
end
