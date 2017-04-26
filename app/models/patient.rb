class Patient < ApplicationRecord
  validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :gender, presence: true
  # validates :BSN, presence: true, length: 8
  # validates :date_of_birth, presence: true
  # validates :address, presence: true
  # validates :postal_code, presence: true
  # validates :place_of_residence, presence: true
  # validates :phone_number
  # validates :email, presence: true
  # validates :insurance_company
  # validates :policy_number
end
