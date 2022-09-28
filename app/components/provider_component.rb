# frozen_string_literal: true

class ProviderComponent < ViewComponent::Base
  with_collection_parameter :providers

  def initialize(providers:)
    @providers = providers
  end

  def account(provider)
    provider.account.nil? ? I18n.t('empty_info_message') : provider.account
  end

  def cell_phone(provider)
    provider.cell_phone.nil? ? I18n.t('empty_info_message') : provider.cell_phone
  end
end
