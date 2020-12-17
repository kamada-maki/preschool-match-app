class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :preschool
  validates :text, presence: true
end
