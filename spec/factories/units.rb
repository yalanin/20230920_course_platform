FactoryBot.define do
  factory :unit do
    name { Faker::Name.name }
    description { Faker::String.random }
    content { Faker::Lorem.paragraph }
    chapter
  end
end
