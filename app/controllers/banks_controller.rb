class BanksController < BankifyController
  before_action :set_entity_params, only: %i[ update create ]
  # Only allow a list of trusted parameters through.
  def set_entity_params
    @entity_params = params.require(:bank).permit(:name)
  end
end
