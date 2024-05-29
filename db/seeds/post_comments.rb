# frozen_string_literal: true

Rails.logger.debug 'Seeding PostComments'

60.times do
  post_comment = PostComment.create(
    user: User.find_by(id: rand(1..10)),
    post: Post.find_by(id: rand(1..30)),
    content: Faker::Books::Lovecraft.paragraphs.join("\n"),
    parent_id: nil
  )

  20.times do
    PostComment.create(
      user: User.find_by(id: rand(1..10)),
      post: post_comment.post,
      content: Faker::Books::Lovecraft.paragraphs.join("\n"),
      parent_id: post_comment.id
    )
  end
end

20.times do
  post = Post.joins(:comments).where.not(comments: { id: nil }).sample

  PostComment.create(
    user: User.find_by(id: rand(1..10)),
    post:,
    content: Faker::Books::Lovecraft.paragraphs.join("\n"),
    parent_id: post.comments.sample.id
  )
end
