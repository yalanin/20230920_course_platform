FactoryBot.define do
  factory :unit do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    content { Faker::Lorem.paragraph }
    chapter
  end
end
