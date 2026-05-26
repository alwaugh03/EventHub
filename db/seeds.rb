# Limpiar base de datos
Registration.destroy_all
Review.destroy_all
Event.destroy_all
Category.destroy_all
Venue.destroy_all
User.destroy_all

puts "Creating users..."

u1 = User.create!(
  email: "alice@test.com",
  role: :regular,
  password: "111111",
  password_confirmation: "111111"
)

u2 = User.create!(
  email: "bob@test.com",
  role: :regular,
  password: "222222",
  password_confirmation: "222222"
)

u3 = User.create!(
  email: "carol@test.com",
  role: :regular,
  password: "333333",
  password_confirmation: "333333"
)

puts "Creating categories..."

tech = Category.create!(
  name: "Tech",
  description: "Technology events"
)

music = Category.create!(
  name: "Music",
  description: "Music related events"
)

sports = Category.create!(
  name: "Sports",
  description: "Sports and outdoor activities"
)

puts "Creating venues..."

auditorium = Venue.create!(
  name: "Auditorium",
  address: "123 Main Street",
  capacity: 300
)

main_hall = Venue.create!(
  name: "Main Hall",
  address: "456 Center Avenue",
  capacity: 200
)

campus_field = Venue.create!(
  name: "Campus Field",
  address: "University Campus",
  capacity: 500
)

puts "Creating events..."

e1 = Event.create!(
  title: "Tech Conference",
  description: "A great tech event",
  category: tech,
  venue: auditorium,
  start_date: Time.current + 2.days,
  end_date: Time.current + 3.days,
  maximum_capacity: 3,
  available_capacity: 3,
  lifecycle_stage: :published,
  organizer: u1
)

e2 = Event.create!(
  title: "Music Festival",
  description: "Live music event",
  category: music,
  venue: main_hall,
  start_date: Time.current + 1.day,
  end_date: Time.current + 2.days,
  maximum_capacity: 5,
  available_capacity: 0,
  lifecycle_stage: :published,
  organizer: u2
)

e3 = Event.create!(
  title: "Sports Meetup",
  description: "Outdoor sports",
  category: sports,
  venue: campus_field,
  start_date: Time.current + 3.days,
  end_date: Time.current + 4.days,
  maximum_capacity: 5,
  available_capacity: 5,
  lifecycle_stage: :completed,
  organizer: u3
)

puts "Creating registrations..."

Registration.create!(
  user: u1,
  event: e1,
  status: :confirmed
)

Registration.create!(
  user: u2,
  event: e1,
  status: :confirmed
)

Registration.create!(
  user: u1,
  event: e2,
  status: :confirmed
)

Registration.create!(
  user: u2,
  event: e2,
  status: :confirmed
)

Registration.create!(
  user: u3,
  event: e2,
  status: :waiting
)

Registration.create!(
  user: u1,
  event: e3,
  status: :confirmed
)

Registration.create!(
  user: u2,
  event: e3,
  status: :confirmed
)

e3.update!(
  lifecycle_stage: :completed,
  start_date: Time.current - 2.days,
  end_date: Time.current - 1.days
)

puts "Creating reviews..."

Review.create!(
  user: u1,
  event: e3,
  rating: 5,
  comment: "Amazing event!"
)

Review.create!(
  user: u2,
  event: e3,
  rating: 4,
  comment: "Really enjoyed it"
)

puts "Seeding completed!"