class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: :posts
  belongs_to :category, class_name: 'Category'

  validates :title, :body, presence: true
  validates :title, length: { minimum: 3, maximum: 255 }

  scope :latest, -> { order(created_at: :desc) }
end
