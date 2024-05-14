User.create(
  username: 'admin',
  first_name: 'Admin',
  last_name: 'Admin',
  email: 'admin@admin.com',
  password: '1234567890'
)

10.times do
  User.create(
    username: Faker::Internet.username(specifier: 8..12),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(domain: 'localhost.lan'),
    password: Faker::Internet.password(min_length: 8)
  )
end

10.times do
  Category.create(name: Faker::Games::DnD.title_name)
end

10.times do
  Post.create(
    title: Faker::Books::Lovecraft.sentence,
    body: Faker::Books::Lovecraft.paragraphs.join("\n"),
    creator: User.find_by(id: rand(1..10)),
    category: Category.find_by(id: rand(1..10))
  )
end

20.times do
  PostComment.create(
    user: User.find_by(id: rand(1..10)),
    post: Post.find_by(id: rand(1..10)),
    content: Faker::Books::Lovecraft.paragraphs.join("\n"),
    parent_id: nil
  )
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
