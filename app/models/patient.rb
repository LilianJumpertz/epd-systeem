class Patient < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :gender, presence: true, , inclusion: { in: %w(man vrouw),
    message: "%{value} is not a valid size" }
  # validates :BSN, presence: true, length: 8
  # validates :date_of_birth, presence: true
  # validates :address, presence: true
  # validates :postal_code, presence: true
  # validates :place_of_residence, presence: true
  # validates :phone_number
  # validates :email, presence: true, uniqueness: true
  # validates :insurance_company
  # validates :policy_number
end
