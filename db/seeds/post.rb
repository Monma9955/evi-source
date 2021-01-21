5.times do |_n|
  Post.create(
    text: Faker::Quotes::Shakespeare.unique.hamlet_quote
  )
end