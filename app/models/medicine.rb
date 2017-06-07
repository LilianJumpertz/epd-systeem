class Medicine < ApplicationRecord

  belongs_to :patient

  validates :generic_name,        length: { maximum: 50 }                              
  validates :brand_name,          presence: true,
                                  length: { maximum: 50 }
  validates :active_ingredient,   presence: true,
                                  length: { maximum: 50 }
  validates :dose,                presence: true,
                                  :numericality => true,
                                  :numericality => { :greater_than => 0 }
  validates :dose_unit,           presence: true
  validates :symptoms,            length: { maximum: 100 }                            

end
