require 'faker'

FactoryBot.define do
  factory :user do |f|
    f.email { Faker::Internet.email[0..50]  }
    f.password { Faker::Internet.password[0..50] }
  end
end
