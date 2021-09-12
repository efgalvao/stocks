FactoryBot.define do
  factory :user do
    name { Faker::TvShows::GameOfThrones.character }
    email { Faker::Internet.email }
    password { '123456789!!!' }
  end
end
