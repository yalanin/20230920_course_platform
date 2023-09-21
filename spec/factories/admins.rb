FactoryBot.define do
  factory :admin do
    username { Faker::Name.name }
    password { SecureRandom.hex(10) }
  end
end