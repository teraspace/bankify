require 'rails_helper'
RSpec.feature 'User signs in' do
  scenario 'with valid credentials', :js => false do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    expect(page).to have_text 'Fintecth disruptor!'
    expect(page).to have_link 'Sign Out'
    expect(page).to have_current_path root_path
  end

  scenario 'with invalid credentials', :js => false do
    user = FactoryBot.build(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'badpassword'
    click_button 'Log In'
    expect(page).to have_text 'Log In Oops! Invalid email or password.'
    expect(page).to have_no_link 'Sign Up'
  end
end
