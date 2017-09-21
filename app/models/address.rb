class Address < ApplicationRecord
  belongs_to :contact
  validates :door_no, :street, :city, :state, :pincode, presence: true

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
