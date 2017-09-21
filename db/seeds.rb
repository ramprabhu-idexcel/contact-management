# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Populate data's for contacts, address & phone numbers table
contact_lists = []

50.times do
  contact_lists << {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.unique.email,
      type: Contact::TYPE.sample,
      addresses_attributes: [{
                                 door_no: Faker::Address.building_number,
                                 street: Faker::Address.street_name,
                                 city: Faker::Address.city,
                                 state: Faker::Address.state,
                                 pincode: Faker::Address.zip_code
                             }, {
                                 door_no: Faker::Address.building_number,
                                 street: Faker::Address.street_name,
                                 city: Faker::Address.city,
                                 state: Faker::Address.state,
                                 pincode: Faker::Address.zip_code
                             }],
      phones_attributes: [{
                              number: Faker::PhoneNumber.cell_phone,
                              type_of: 'Mobile'
                          }, {
                              number: Faker::PhoneNumber.phone_number,
                              type_of: 'LandLine'
                          }]
  }
end

puts "##############################################  DB:SEED:START ################################################"

Contact.destroy_all

Contact.create!(contact_lists)

puts "##############################################  DB:SEED:END ##################################################"





