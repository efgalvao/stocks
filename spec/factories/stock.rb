FactoryBot.define do
  factory :stock do
    name { Faker::Bank.name }
    savings { false }

    trait :savings do
      savings { true }
    end
  end
end
