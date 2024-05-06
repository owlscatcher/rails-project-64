10.times do
  Category.create(name: Faker::Games::DnD.title_name)
end
