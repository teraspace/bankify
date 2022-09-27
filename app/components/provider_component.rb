# frozen_string_literal: true

class ProviderComponent < ViewComponent::Base
  with_collection_parameter :providers

  def initialize(providers:)
    @providers = providers
  end
end
