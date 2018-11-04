class Product < ApplicationRecord
  include CipherConcern

  validates :title, presence: true, length: { maximum: 60 }
  validates :team_name, presence: true, length: { maximum: 60 }
  validates :description, length: { maximum: 400 }
  validates :receipt_number, numericality: { only_integer: true,
                                             greater_than_or_equal_to: 0,
                                             less_than_or_equal_to: 4_294_967_295 }
end
