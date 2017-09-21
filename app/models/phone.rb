class Phone < ApplicationRecord
  TYPE = ["Mobile","Fax","LandLine"]
  belongs_to :contact
  validates :type_of, :number, presence: true
end
