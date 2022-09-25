
require 'warden'
include Warden::Test::Helpers

def with_user user_email, &block
  user = User.where(:email => user_email).first
  yield(user)
end

def log_in_as(user_email,password)
  with_user(user_email) do |user|
      visit "/users/sign_in"
      fill_in("Email", :with => user.email)
      fill_in("Password", :with => password)
      click_button("Sign In")
  end
end

def sign_out
  click_link("Sign Out")
end

