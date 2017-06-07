class Patient < ApplicationRecord
  
  has_many :medicines

  before_validation { gender.downcase! }
  before_validation { postal_code.gsub(/\s+/, '') }
  before_save { email.downcase! }
  
  VALID_ADDRESS_REGEX = /\A(\S)(.*)(\S)\s(\d+)(\S*)\z/i
  # Starting with a non-whitespace character (\S), followed 0 or more of any characters (.*), ending with a non-whitespace character.
  # Then 1 space (\s) and one or more digits (\d+) and 0 or more non-whitespace characters. Case-insensitive (/i).    
  
  VALID_POSTAL_CODE_REGEX = /\A(\d{4})([A-Z]{2})\z/i
  # Starting with 4 numbers (\d{4}), followed by 2 capital letters ([A-Z]{2}).

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name,          presence: true,
                                  length: { maximum: 50 }
  validates :last_name,           presence: true,
                                  length: { maximum: 50 }
  validates :gender,              presence: true,
                                  inclusion: { in: %w(man vrouw), message: "%{value} is not a valid gender" }
  validates :BSN,                 presence: true,
                                  numericality: { only_integer: true },
                                  length: { is: 8, wrong_length: "should consist of %{count} numbers" }
  validates :date_of_birth,       presence: true,
                                  :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}
  validates :address,             presence: true,
                                  length: { maximum: 50 },
                                  format: { with: VALID_ADDRESS_REGEX }
  validates :postal_code,         presence: true,
                                  format: { with: VALID_POSTAL_CODE_REGEX }
  validates :place_of_residence,  presence: true,
                                  length: { maximum: 50 }
  validates :phone_number,        length: { in: 10..13 }
  validates :email,               presence: true,
                                  format: { with: VALID_EMAIL_REGEX },
                                  uniqueness: { case_sensitive: false }
  validates :insurance_company,   length: { maximum: 50 }
  validates :policy_number,       length: { maximum: 20 },
                                  numericality: { only_integer: true }
end
