class Preschool < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  validates :area_id,:category_id,numericality: {only_integer: true} 
  belongs_to :admin
  has_many_attached :images
  validates :name, length: { maximum: 20 }
  validates :post_number ,format:{ with: /\A\d{3}[-]\d{4}\z/}
  validates :phone_number,format:{ with: /\A[0-9]+\z/},length: { maximum: 11 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :comments, dependent: :destroy
  has_many :likes
  with_options presence: true do
    validates :name
    validates :post_number
    validates :address
    validates :phone_number
    validates :access
    validates :open_hour
    validates :close_hour
    validates :capacity 
    validates :concept
    validates :email
  end
end
