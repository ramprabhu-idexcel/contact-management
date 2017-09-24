FactoryGirl.define do
  factory :address do
    door_no { Faker::Address.building_number }
    street { Faker::Address.street_name }
    city { Faker::Address.city_suffix }
    state { Faker::Address.state }
    pincode { Faker::Address.zip_code }
  end
end
