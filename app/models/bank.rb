class Bank < ApplicationRecord
  belongs_to :user
  validates :name, length: { minimum: 1, maximum: 50 }, allow_blank: false
end
