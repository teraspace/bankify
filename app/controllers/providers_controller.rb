class ProvidersController < BankifyController
  before_action :set_entity_params, only: %i[ update create ]
  # Only allow a list of trusted parameters through.
  def set_entity_params
    @entity_params = params.require(:provider).permit(:name, :nit, :contact_name, :cell_phone, :bank_id, :account)
  end
end
