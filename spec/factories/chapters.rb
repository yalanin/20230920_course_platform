FactoryBot.define do
  factory :chapter do
    name { Faker::Name.name }
    course
  end
end
