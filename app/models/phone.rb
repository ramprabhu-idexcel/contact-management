class Phone < ApplicationRecord
  TYPE = %w(Mobile Fax LandLine)
  NUMBERFORMAT = '123-456-7890 OR
            (123) 456-7890 OR
            123 456 7890 OR
            123.456.7890 OR
            +91 (123) 456-7890'
  VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/
  belongs_to :contact
  validates :type_of, :number, presence: true
  validates :number, length: { minimum: 5, maximum: 20 }, if: Proc.new{|f| f.number.present? }
  validates :number, format: { with: VALID_PHONE_NUMBER_REGEX, message: "format should be like #{NUMBERFORMAT}" }, if: Proc.new{|f| f.number.present? }
end
