# Limpiar base de datos
Registration.destroy_all
Review.destroy_all
Event.destroy_all
User.destroy_all

puts "Creating users..."

u1 = User.create!(email: "alice@test.com", role: :regular)
u2 = User.create!(email: "bob@test.com", role: :regular)
u3 = User.create!(email: "carol@test.com", role: :regular)

puts "Creating events..."


e1 = Event.create!(
  title: "Tech Conference",
  description: "A great tech event",
  category: "Tech",
  venue: "Auditorium",
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
  category: "Music",
  venue: "Main Hall",
  start_date: Time.current + 1.day,
  end_date: Time.current + 2.days,
  maximum_capacity: 2,
  available_capacity: 0,
  lifecycle_stage: :published,
  organizer: u2
)


e3 = Event.create!(
  title: "Sports Meetup",
  description: "Outdoor sports",
  category: "Sports",
  venue: "Campus Field",
  start_date: Time.current - 5.days,
  end_date: Time.current - 4.days,
  maximum_capacity: 5,
  available_capacity: 5,
  lifecycle_stage: :completed,
  organizer: u3
)

puts "Creating registrations..."


Registration.create!(user: u1, event: e1, status: :confirmed)
Registration.create!(user: u2, event: e1, status: :confirmed)

Registration.create!(user: u1, event: e2, status: :confirmed)
Registration.create!(user: u2, event: e2, status: :confirmed)
Registration.create!(user: u3, event: e2, status: :waiting)


r1 = Registration.new(user: u1, event: e3, status: :confirmed)
r1.save(validate: false)

r2 = Registration.new(user: u2, event: e3, status: :confirmed)
r2.save(validate: false)
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