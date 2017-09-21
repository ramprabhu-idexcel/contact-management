class Phone < ApplicationRecord
  belongs_to :contact
  validates :type_of, :number, presence: true
end
