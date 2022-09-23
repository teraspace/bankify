#frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :new_user_instance

  def new_user_instance
    @user = User.new
  end
end
