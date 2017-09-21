class Address < ApplicationRecord
  belongs_to :contact
  validates :door_no, :street, :city, :state, :pincode, presence: true
end
