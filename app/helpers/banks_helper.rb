module BanksHelper
  def edit_path(subject)
    edit_bank_path(subject)
  end
  def delete_path(subject)
    bank_path(subject)
  end
end
