FactoryGirl.define do
  factory :phone do
    number { Faker::PhoneNumber.cell_phone }
    type_of { "Mobile" }
  end
end
