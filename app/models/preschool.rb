class Preschool < ApplicationRecord
  validates :area_id,:category_id,numericality:{other_than:1}
  belongs_to :area
  belongs_to :category
  belongs_to :admin
  validates :name, length: { maximum: 20 }
  validates :post_number ,format:{ with: /\A\d{3}[-]\d{4}\z/}
  validates :phone_number,format:{ with: /\A[0-9]+\z/},length: { maximum: 11 }
  
  with_options presence: true do
  validates :name
  validates :post_number
  validates :street_number
  validates :building
  validates :phone_number
  validates :open_hour
  validates :close_hour
  validates :capacity 
  validates :concept
end
