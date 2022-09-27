class ProvidersController < ResponseController
  private

  # Only allow a list of trusted parameters through.
  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_name, :cell_phone, :bank_id, :account)
  end
end
