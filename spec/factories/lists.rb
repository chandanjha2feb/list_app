require 'faker'

FactoryBot.define do
  factory :list do
        name { Faker::Name.name }
        status { Faker::Boolean.boolean }
    end
  end
end
