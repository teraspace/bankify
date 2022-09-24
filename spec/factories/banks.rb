require 'faker'

FactoryBot.define do
  factory :bank do |f|
    association :user
    f.name { Faker::Bank.name[1..50] }
  end
end
