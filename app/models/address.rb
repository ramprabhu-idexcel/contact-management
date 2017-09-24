class Address < ApplicationRecord
  belongs_to :contact
  validates :door_no, :street, :city, :state, :pincode, presence: true
  validates :door_no, length: { minimum: 2, maximum: 10 }, if: Proc.new{|f| f.door_no.present? }
  validates :city, length: { minimum: 2, maximum: 20 }, if: Proc.new{|f| f.city.present? }
  validates :state, length: { minimum: 2, maximum: 20 }, if: Proc.new{|f| f.state.present? }
  validates :pincode, length: { minimum: 2, maximum: 10 }, if: Proc.new{|f| f.pincode.present? }

  # address format
  def format
    <<-HEREDOC
      #{door_no},<br/>
      #{street},<br/>
      #{city},<br/>
      #{state},<br/>
      #{pincode}.<br/>
    HEREDOC
  end
end
