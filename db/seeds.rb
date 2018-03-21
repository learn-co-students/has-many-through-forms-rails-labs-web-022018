# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{username: "sinclair", email: "poop@poop.com"}, {username: "sdfsdf", email: "shit@shit.com"}])
posts = Post.create([{title: "FIRST PoSTsfdkj", content: "SDFLJKSDKLF slkjfd a;wernkrewn lkjdsfjklfdlskjwer j dfsjkldjslk"},
  {title: "#2", content: "bad day"}])
categories = Category.create([{name: "Stupid"}, {name: "Very Bad"}, {name: "No Good"}])
comments = Comment.create([{content: "hi", user: users[0], post: posts[0]}, {content: "hi", user: users[1], post: posts[0]},
  {content: "hi", user: users[1], post: posts[0]}, {content: "hi", user: users[1], post: posts[1]}])
post_categories = PostCategory.create([{post: posts[0], category: categories[0]}, {post: posts[0], category: categories[1]},
  {post: posts[1], category: categories[1]}, {post: posts[1], category: categories[2]}])
