25.times do 
	article = Article.new
	article.title = Faker::Book.title
	article.body= Faker::Lorem.paragraph
	article.category_id = Category.all.sample.id
	article.publish_date = Faker::Date.between(2.days.ago, Date.today)
	article.save
end

require 'faker'
5.times do
  category = Category.new
  category.name = Faker::Book.genre
  category.save
end

10.times do
  article = Article.new
  article.title = Faker::Book.title
  article.body = Faker::Lorem.paragraph
  article.publish_date = Faker::Date.forward(3)
  category = Category.all.sample
  article.category_id = category.id
  article.save
end


50.times do
  comment = Comment.new
  comment.title = Faker::Name.name
  comment.body = Faker::Lorem.sentence
  article = Article.all.sample
  comment.article_id = article.id
  comment.save
end
 