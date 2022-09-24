require 'rails_helper'

RSpec.describe User, type: :model do

  subject { FactoryBot.create(:user) }

  it 'is not valid without valid attributes' do
    expect(FactoryBot.build(:user, email: nil, password: nil)).to be_invalid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
