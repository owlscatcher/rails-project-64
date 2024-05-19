# frozen_string_literal: true
class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: :posts
  belongs_to :category, class_name: 'Category'

  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy

  validates :title, :body, presence: true
  validates :title, length: { minimum: 3, maximum: 255 }

  scope :latest, -> { order(created_at: :desc) }
end
