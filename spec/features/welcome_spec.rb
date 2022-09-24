require 'rails_helper'
RSpec.feature 'User visit bankify' do
  scenario 'with valid data', :js => false do
    visit welcome_index_url
    expect(page).to have_text 'Fintecth disruptor!'
    expect(page).to have_link 'Sign Up'
    click_on 'Sign Up'
    expect(page).to have_current_path new_user_registration_path
  end
end
