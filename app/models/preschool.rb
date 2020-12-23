class Preschool < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  validates :area_id,:category_id,numericality:{other_than:1}
  belongs_to :admin
  has_many_attached :images
  validates :name, length: { maximum: 20 }
  validates :post_number ,format:{ with: /\A\d{3}[-]\d{4}\z/}
  validates :phone_number,format:{ with: /\A[0-9]+\z/},length: { maximum: 11 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  with_options presence: true do
  validates :name
  validates :post_number
  validates :street_number
  validates :phone_number
  validates :station
  validates :open_hour
  validates :close_hour
  validates :capacity 
  validates :concept
  validates :email
  end
  has_many :comments, dependent: :destroy
end
