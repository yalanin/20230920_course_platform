FactoryBot.define do
  factory :chapter do
    name { Faker::Name.name }
    course

    trait :with_units do
      transient do
        amount { 1 }
      end
      units { build_list :unit, amount }
    end
  end
end
