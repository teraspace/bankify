require 'rails_helper'
RSpec.feature 'User signs up' do
  scenario 'with valid data', :js => false do
    visit new_user_registration_path
    fill_in 'user_email', with: 'username@example.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button t('sign_up')
    expect(page).to have_text t('welcome')
    expect(page).to have_link t('sign_out')
    expect(page).to have_current_path root_path
  end
end
