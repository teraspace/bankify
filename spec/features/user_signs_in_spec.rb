require 'rails_helper'
RSpec.feature 'User signs in' do
  scenario 'with valid credentials', js: false do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button t('login')
    expect(page).to have_text t('example_text')
    expect(page).to have_link t('sign_out')
    expect(page).to have_current_path root_path
  end

  scenario 'with invalid credentials', js: false do
    user = FactoryBot.build(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'badpassword'
    click_button t('login')
    expect(page).to have_text t('oops')
    expect(page).to have_no_link t('sign_up')
  end
end
