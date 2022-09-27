# frozen_string_literal: true

class ActionsComponent < ViewComponent::Base
  with_collection_parameter :banks

  def initialize(banks:)
    @banks = banks
  end
  def edit_path(subject)
    edit_bank_path(subject)
  end
  def delete_path(subject)
    bank_path(subject)
  end
end
