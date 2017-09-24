class Contact < ApplicationRecord
  TYPE = %w(Business Personal)
  self.inheritance_column = 'type'
  has_many :addresses, dependent: :destroy
  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :addresses

  validates :first_name, :last_name, :age, :email, :type, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, if: Proc.new{ |f| f.email.present? }
  validates_uniqueness_of :email, if: Proc.new{ |f| f.email.present? }
  validates_numericality_of :age, less_than_or_equal_to: 100, greater_than: 0, if: Proc.new{ |f| f.age.present? }

  def all_addresses
    address = ''
    addresses.each { |addr| address << addr.format << '\n' }
    address
  end

  def all_phones
    phones.pluck(:number).join(",")
  end

  def name
    "#{first_name} #{last_name}"
  end
end
