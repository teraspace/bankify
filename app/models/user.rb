class User < ApplicationRecord
  has_many :banks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    presence: true,
                    uniqueness: true
  validates :encrypted_password, presence: true
  has_many :banks, dependent: :nullify
  has_many :providers, dependent: :nullify
end
