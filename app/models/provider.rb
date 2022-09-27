class Provider < ApplicationRecord
  belongs_to :user
  belongs_to :bank

  validates :name, presence: true
  validates :nit, presence: true, format: { with: /(^[0-9]+-{1}[0-9]{1})/ }
  validates :contact_name, presence: true
  validates :bank_id, presence: true
  validates_length_of :account, maximum: 15
  validates_length_of :cell_phone, minimum: 10, maximum: 10
end
