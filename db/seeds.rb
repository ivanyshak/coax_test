puts "Starting to run seeds file..."

user = User.create_with(
  avatar: "vasia.jpg",
  password: "qwerty",
  password_confirmation: "qwerty",
  first_name: "Jon",
  last_name: "Snow",
  is_female: true
).find_or_create_by(email: "ivanyshak.vasia@gmail.com")

category = Category.find_or_create_by(name: "My Category")

100.times do |index|
  bike = Bicycle.create(
    name: "My Title #{index}",
    category_id: category.id,
    user_id: user.id
  )
  picture = Picture.create(
    image_url: "dummy_image.jpg",
    imageable_id: bike.id,
    imageable_type: "Bicycle"
  )
end

puts "100 Bicycle created"