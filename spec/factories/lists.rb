require 'faker'

FactoryGirl.define do
  factory :list do |f|
      f.name { Faker::Name.first_name }
      f.status { Faker::Boolean.boolean }
    end
  end
end
