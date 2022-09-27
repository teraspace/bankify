# Rails 6
def login(user)
  post user_session_path, params: {
    user: {
      email: user.email, password: user.password
    }
  }
  follow_redirect!
end
