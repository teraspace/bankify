require 'rails_helper'

RSpec.describe Bank, type: :model do
  let(:user) { FactoryBot.create(:user) }
  subject { FactoryBot.create(:bank, user: user) }

  it 'is not valid without valid attributes' do
    expect(FactoryBot.build(:bank, name: nil)).to be_invalid
    expect(FactoryBot.build(:bank, name: Faker::Lorem.characters(number: 51) )).to be_invalid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
