require_relative '../app/models/teacher'
require 'faker'

module TeachersImporter
  def self.import
    field_names = [:first_name, :last_name, :email, :address, :phone]
    Teacher.transaction do
      9.times do
        data = []
        data << Faker::Name.first_name
        data << Faker::Name.last_name
        data << Faker::Internet.email
        data << Faker::Address.street_address
        data << Faker::PhoneNumber.phone_number
        attribute_hash = Hash[field_names.zip(data)]
        teacher = Teacher.create!(attribute_hash)
      end
    end
  end
end
