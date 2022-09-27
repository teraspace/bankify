class Bank < ApplicationRecord
  belongs_to :user
  has_many :providers, dependent: :nullify
  
  validates :name, length: { minimum: 1, maximum: 50 }, allow_blank: false
end
