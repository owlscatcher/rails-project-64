# frozen_string_literal: true

(1..30).each do |post_id|
  (1..10).each do |user_id|
    PostLike.create!(post_id:, user_id:)
  end
end
