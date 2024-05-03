class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', inverse_of: :posts

  validates :title, :content, presence: true
  validates :title, length: { minimum: 3, maximum: 255 }
  validates :content, length: { minimum: 10, maximum: 500 }

  scope :latest, -> { order(id: :desc) }
end
