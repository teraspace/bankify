require 'faker'

FactoryBot.define do
  factory :provider do |f|
    association :user
    association :bank
    f.name { Faker::Appliance.brand }
    # 9.002.185.787
    f.nit { "#{Faker::Number.between(from: 1_000_000_000, to: 9_999_999_999)}-#{Faker::Number.between(from: 0, to: 9)}" }
    f.contact_name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    f.cell_phone { Faker::Bank.account_number(digits: 10) }
    f.account { Faker::Bank.account_number(digits: 15) }

    trait :with_bank do
      bank { FactoryBot.create(:bank) }
    end

  end
end
