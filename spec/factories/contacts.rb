FactoryGirl.define do
  factory :contact do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    age { Faker::Number.number(2) }
    email { Faker::Internet.email }
    type  { Contact::TYPE.sample }

    trait :with_addresses do
      after(:create) do |contact, _evaluator|
        FactoryGirl.create_list(:address, 1, contact: contact)
      end
    end

    trait :with_phones do
      after(:create) do |contact, _evaluator|
        FactoryGirl.create_list(:phone, 1, contact: contact)
      end
    end
  end
end
