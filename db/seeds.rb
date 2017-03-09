# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Comment.destroy_all
Post.destroy_all
Vote.all
100.times do
  User.create(username: Faker::Name.name, password: '123')
end

users = User.all
300.times do
  Post.create(title: Faker::Hipster.word,
              body: Faker::ChuckNorris.fact,
              user: User.all.sample)
end
posts = Post.all

500.times do
  Comment.create(body: Faker::Hipster.sentence,
                 post: Post.all.sample,
                 user: User.all.sample)
end
comments = Comment.all

100000.times do
  values =  [1,1,1,1,-1]
  votables = [posts, comments].flatten
  Vote.create(value: values.sample,
              votable: votables.sample,
              user: users.sample)
end
