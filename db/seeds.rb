# create users

user1 = User.find_by(email: 'user1@example.com')
unless user1.present?
  user1 = User.create(
    firstname: 'Gandalf',
    lastname: 'The White',
    email: 'user@example.com',
    admin: 'true',
    password: 'useruser1'
  )
end

user2 = User.find_by(email: 'user2@example.com')
unless user2.present?
  user2 = User.create(
    firstname: 'Gollum',
    lastname: 'AKA Smeagol',
    email: 'user1@example.com',
    admin: 'false',
    password: 'useruser2'
  )
end

user3 = User.find_by(email: 'user3@example.com')
unless user3.present?
  user3 = User.create(
    firstname: 'Peregrin',
    lastname: 'Took',
    email: 'user2@example.com',
    admin: 'false',
    password: 'useruser3'
  )
end

user4 = User.find_by(email: 'user4@example.com')
unless user4.present?
  user4 = User.create(
    firstname: 'Meriadok',
    lastname: 'Brandybuck',
    email: 'user3@example.com',
    admin: 'false',
    password: 'useruser4'
  )
end

user5 = User.find_by(email: 'user5@example.com')
unless user5.present?
  user5 = User.create(
    firstname: 'Samwise',
    lastname: 'Gumgee',
    email: 'user4@example.com',
    admin: 'false',
    password: 'useruser5'
  )
end

user6 = User.find_by(email: 'user6@example.com')
unless user6.present?
  user6 = User.create(
    firstname: 'Frodo',
    lastname: 'Baggins',
    email: 'user5@example.com',
    admin: 'false',
    password: 'useruser6'
  )
end

# create categories

category1 = Category.find_or_create_by(name: 'Jewelery')
category2 = Category.find_or_create_by(name: 'Pipeweed')
category3 = Category.find_or_create_by(name: 'Doilies')
category4 = Category.find_or_create_by(name: 'Tickets')
Category.find_or_create_by(name: 'Food')

# create products with reviews

product_params = {
  title: 'One Ring',
  description: 'So pretty, it could be Your precious!',
  category_id: category1.id,
  user_id: user2.id,
  price: '10000'
}
product = Product.find_by(product_params)
if product.blank?
  product = Product.create(product_params)
  Review.create(
    content: "It's ours! Keep Your dirty hands away!",
    rating: '5',
    created_at: '1200-05-12'.to_date,
    user_id: user2.id,
    product_id: product.id
  )
  Review.create(
    content: 'I like to wear it on my necklace.',
    rating: '5',
    created_at: '1200-07-20'.to_date,
    user_id: user6.id,
    product_id: product.id
  )
  Review.create(
    content: 'Hate that stupid ring! Frodo used to look at me like this :(',
    rating: '1',
    created_at: '1200-07-30'.to_date,
    user_id: user5.id,
    product_id: product.id
  )
end

product_params = {
  title: 'Palantir',
  description: 'Not realy a jewelery, but looks like a cristal ball.',
  category_id: category1.id,
  user_id: user3.id,
  price: '5000'
}
product = Product.find_by(product_params)
if product.blank?
  product = Product.create(product_params)
  Review.create(
    content: "It's not HD... Audio 7/10.",
    rating: '3',
    created_at: '1200-06-17'.to_date,
    user_id: user3.id,
    product_id: product.id
  )
  Review.create(
    content: 'Always wanted a walkie-talkie with a cam :D',
    rating: '5',
    created_at: '1200-06-20'.to_date,
    user_id: user1.id,
    product_id: product.id
  )
end

product_params = {
  title: 'Old Tobey',
  description: 'Finest stuff from southern quarter.',
  category_id: category2.id,
  user_id: user4.id,
  price: '100'
}
product = Product.find_by(product_params)
if product.blank?
  product = Product.create(product_params)
  Review.create(
    content: 'Brings memories. Once I sat on an iron pig.
    Turned out it was a dwarf in armor xD',
    rating: '5',
    created_at: '1200-04-13'.to_date,
    user_id: user4.id,
    product_id: product.id
  )
  Review.create(
    content: 'Watch out- you buy it and buy it, but there is never enough :/',
    rating: '4',
    created_at: '1200-04-14'.to_date,
    user_id: user3.id,
    product_id: product.id
  )
end

product_params = {
  title: 'Mordor',
  description: 'Go on foot or fly by eagle!',
  category_id: category4.id,
  user_id: user6.id,
  price: '2000.50'
}
product = Product.find_by(product_params)
if product.blank?
  product = Product.create(product_params)
  Review.create(
    content: 'Not very frendly and You might want to
    take hike-boots with You...',
    rating: '2',
    created_at: '1200-08-07'.to_date,
    user_id: user6.id,
    product_id: product.id
  )
  Review.create(
    content: 'Cloudy weather, do not take sunglasses!
    But eagles totally rocked!',
    rating: '4',
    created_at: '1200-08-20'.to_date,
    user_id: user5.id,
    product_id: product.id
  )
  Review.create(
    content: 'Bad memories. Crazy chicks :/',
    rating: '1',
    created_at: '1200-04-20'.to_date,
    user_id: user2.id,
    product_id: product.id
  )
end

product_params = {
  title: 'Rivendell',
  description: 'Beatuiful elvish city- not only for vegetarians.',
  category_id: category4.id,
  user_id: user5.id,
  price: '1000.99'
}
product = Product.find_or_create_by(product_params)

product_params = {
  title: 'Pink Regular',
  description: 'Distinguish, silk doilie with little roses.',
  category_id: category3.id,
  user_id: user6.id,
  price: '15.89'
}
product = Product.find_by(product_params)
if product.blank?
  product = Product.create(product_params)
  Review.create(
    content: 'Seen King of Angmar with one of these! :P',
    rating: '4',
    created_at: '1200-09-03'.to_date,
    user_id: user4.id,
    product_id: product.id
  )
  Review.create(
    content: 'My uncle used to have similar! They realy are incredibly soft.',
    rating: '5',
    created_at: '1200-06-20'.to_date,
    user_id: user6.id,
    product_id: product.id
  )
end
