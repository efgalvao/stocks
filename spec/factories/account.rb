FactoryBot.define do
  factory :account do
    name { Faker::Bank.name }
    savings { false }

    trait :savings do
      savings { true }
    end
  end
end
