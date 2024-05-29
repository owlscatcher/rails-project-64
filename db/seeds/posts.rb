# frozen_string_literal: true

Rails.logger.debug 'Seeding Posts'

30.times do
  Post.create(
    title: Faker::Books::Lovecraft.sentence,
    body: Faker::Books::Lovecraft.paragraphs.join("\n"),
    creator: User.find_by(id: rand(1..10)),
    category: Category.find_by(id: rand(1..10))
  )
end
