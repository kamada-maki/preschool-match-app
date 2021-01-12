class Price < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  with_options presence: true do
    validates :age
    validates :free_price
    validates :not_free_price
  end
end
