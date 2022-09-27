require 'rails_helper'

RSpec.describe Provider, type: :model do
  let(:user) { FactoryBot.create(:user) }
  subject { FactoryBot.create(:provider, user: user) }

  it 'is not valid without valid attributes' do
    expect(FactoryBot.build(:provider, name: nil)).to be_invalid
    expect(FactoryBot.build(:provider, name: Faker::Appliance.brand, nit: nil)).to be_invalid
    expect(FactoryBot.build(:provider, name: Faker::Appliance.brand, nit: '1')).to be_invalid
    expect(FactoryBot.build(:provider, account: Faker::Bank.account_number(digits: 16))).to be_invalid
    expect(FactoryBot.build(:provider, cell_phone: Faker::Bank.account_number(digits: 9))).to be_invalid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
