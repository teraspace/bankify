class Provider < ApplicationRecord
  belongs_to :user
  belongs_to :bank

  validates :name, presence: true
  validates :nit, presence: true, format: { with: /(^[0-9]+-{1}[0-9]{1})/ }
  validates :contact_name, presence: true
  validates :bank_id, presence: true
  validates_length_of :account, maximum: 15
  validates :cell_phone, length: { minimum: 10, maximum: 10 }, allow_blank: true
  validates :account, length: { minimum: 1, maximum: 15 }, allow_blank: true
  validates_length_of :nit, minimum: 10, maximum: 12
end
