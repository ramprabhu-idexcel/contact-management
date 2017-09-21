class Phone < ApplicationRecord
  TYPE = %w(Mobile Fax LandLine)
  belongs_to :contact
  validates :type_of, :number, presence: true
end
