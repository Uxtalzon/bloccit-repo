require 'faker'

# Create Posts
1.times do
  Post.create!(
    title: "Third test in assignment",
    body: "I can't remember any Latin from my classes in high school."
    )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"