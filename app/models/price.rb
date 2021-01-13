class Price < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :age
  with_options presence: true do
    validates :free_price
    validates :not_free_price
    validates :category_id
    validates :age_id
  end
end
