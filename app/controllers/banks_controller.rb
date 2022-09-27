class BanksController < ResponseController
  # Only allow a list of trusted parameters through.
  def bank_params
    params.require(:bank).permit(:name)
  end
end
