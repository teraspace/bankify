# frozen_string_literal: true

class DashboardComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end
end
