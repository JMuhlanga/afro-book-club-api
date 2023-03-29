# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Create some users with hashed passwords
user1 = User.create(username: 'johndoe', email: 'johndoe@example.com', password_digest: BCrypt::Password.create('password123'))
user2 = User.create(username: 'janedoe', email: 'janedoe@example.com', password_digest: BCrypt::Password.create('password456'))



# Create some books
book1 = user1.books.create(title: 'The Color Purple', img: 'https://images-na.ssl-images-amazon.com/images/I/81M1DvRqsNL.jpg', bookLink: 'https://www.amazon.com/Color-Purple-Alice-Walker/dp/0156031825', description: 'The Color Purple is a 1982 epistolary novel by American author Alice Walker which won the 1983 Pulitzer Prize for Fiction and the National Book Award for Fiction.', user: user1)
book2 = user2.books.create(title: 'The Bluest Eye', img: 'https://images-na.ssl-images-amazon.com/images/I/71WbHESDvTL.jpg', bookLink: 'https://www.amazon.com/Bluest-Eye-Vintage-International/dp/0307278441', description: 'The Bluest Eye is Toni Morrison\'s first novel, a book heralded for its richness of language and boldness of vision.', user: user2)


# Create some comments
comment1 = Comment.create(content: 'I loved this book!', book: book1, user: user1)
comment2 = Comment.create(content: 'This book was really inspiring.', book: book2, user: user2)

# Create some ratings
rating1 = Rating.create(value: 4, book: book1)
rating2 = Rating.create(value: 5, book: book2)