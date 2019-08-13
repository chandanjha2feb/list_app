require 'faker'

FactoryBot.define do
  factory :list_item do
        name { Faker::Name.name }
        status { Faker::Boolean.boolean }
        list_id {:list}
    end
  end
end
