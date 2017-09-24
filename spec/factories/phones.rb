FactoryGirl.define do
  factory :phone do
    number { Faker::Base.numerify('+90 (###) ### ####') }
    type_of { "Mobile" }
  end
end
