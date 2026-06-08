# db/seeds.rb

# Limpiar base de datos existente
Registration.destroy_all
Review.destroy_all
Event.destroy_all
Category.destroy_all
Venue.destroy_all
User.destroy_all

puts "Seeding database..."
puts "\nCreating users..."

admin = User.create!(
  email: "admin@test.com",
  role: :admin,
  password: "admin123",
  password_confirmation: "admin123",
  first_name: "Admin",
  last_name: "User",
  phone: "+56911111111"
)

# Usuarios regulares
u1 = User.create!(
  email: "alice@test.com",
  role: :regular,
  password: "111111",
  password_confirmation: "111111",
  first_name: "Alice",
  last_name: "Wonder",
  phone: "+56922222222"
)

u2 = User.create!(
  email: "bob@test.com",
  role: :regular,
  password: "222222",
  password_confirmation: "222222",
  first_name: "Bob",
  last_name: "Builder",
  phone: "+56933333333"
)

u3 = User.create!(
  email: "carol@test.com",
  role: :regular,
  password: "333333",
  password_confirmation: "333333",
  first_name: "Carol",
  last_name: "Danvers",
  phone: "+56944444444"
)

# Usuarios adicionales
u4 = User.create!(
  email: "david@test.com",
  role: :regular,
  password: "444444",
  password_confirmation: "444444",
  first_name: "David",
  last_name: "Smith",
  phone: "+56955555555"
)

u5 = User.create!(
  email: "emma@test.com",
  role: :regular,
  password: "555555",
  password_confirmation: "555555",
  first_name: "Emma",
  last_name: "Jones",
  phone: "+56966666666"
)

puts "Created #{User.count} users (1 admin, #{User.where(role: :regular).count} regular)"
puts "\nCreating categories..."

tech = Category.create!(
  name: "Tech",
  description: "Technology events - conferences, workshops, hackathons"
)

music = Category.create!(
  name: "Music",
  description: "Music related events - concerts, festivals, recitals"
)

sports = Category.create!(
  name: "Sports",
  description: "Sports and outdoor activities"
)

business = Category.create!(
  name: "Business",
  description: "Business networking and professional development"
)

education = Category.create!(
  name: "Education",
  description: "Educational workshops and seminars"
)

puts "Created #{Category.count} categories"
puts "\nCreating venues..."

auditorium = Venue.create!(
  name: "Auditorium",
  address: "123 Main Street, Downtown",
  capacity: 300
)

main_hall = Venue.create!(
  name: "Main Hall",
  address: "456 Center Avenue, Midtown",
  capacity: 200
)

campus_field = Venue.create!(
  name: "Campus Field",
  address: "University Campus, Northside",
  capacity: 500
)

conference_center = Venue.create!(
  name: "Conference Center",
  address: "789 Business Park, Eastside",
  capacity: 400
)

rooftop = Venue.create!(
  name: "Rooftop Garden",
  address: "321 Skyline Blvd, Westside",
  capacity: 150
)

puts "Created #{Venue.count} venues"
puts "\nCreating events..."

e1 = Event.create!(
  title: "Tech Conference 2026",
  description: "Annual technology conference with industry leaders",
  category: tech,
  venue: conference_center,
  start_date: Time.current + 2.days,
  end_date: Time.current + 3.days,
  maximum_capacity: 5,
  available_capacity: 5,
  lifecycle_stage: :published,
  organizer: admin
)

e2 = Event.create!(
  title: "Summer Music Festival",
  description: "Live music from top artists",
  category: music,
  venue: main_hall,
  start_date: Time.current + 1.day,
  end_date: Time.current + 2.days,
  maximum_capacity: 5,
  available_capacity: 5,
  lifecycle_stage: :published,
  organizer: admin
)

e3 = Event.create!(
  title: "Weekend Sports Meetup",
  description: "Outdoor sports and team activities",
  category: sports,
  venue: campus_field,
  start_date: Time.current + 3.days,
  end_date: Time.current + 4.days,
  maximum_capacity: 5,
  available_capacity: 5,
  lifecycle_stage: :published,
  organizer: u1
)

e4 = Event.create!(
  title: "Business Networking Night",
  description: "Connect with local entrepreneurs",
  category: business,
  venue: conference_center,
  start_date: Time.current + 5.days,
  end_date: Time.current + 5.days + 4.hours,
  maximum_capacity: 4,
  available_capacity: 4,
  lifecycle_stage: :published,
  organizer: u2
)

e5 = Event.create!(
  title: "Web Development Workshop",
  description: "Learn modern web development",
  category: tech,
  venue: auditorium,
  start_date: Time.current + 7.days,
  end_date: Time.current + 7.days + 6.hours,
  maximum_capacity: 3,
  available_capacity: 3,
  lifecycle_stage: :draft,
  organizer: u3
)

e6 = Event.create!(
  title: "New Year's Eve Party",
  description: "Celebration with live music and dancing",
  category: music,
  venue: rooftop,
  start_date: Time.current + 10.days,  # Temporalmente futuro
  end_date: Time.current + 11.days,
  maximum_capacity: 5,
  available_capacity: 5,
  lifecycle_stage: :published,
  organizer: u4
)

puts "Created #{Event.count} events"
puts "\nCreating registrations..."

Registration.create!(user: u1, event: e1, status: :confirmed)
Registration.create!(user: u2, event: e1, status: :confirmed)
Registration.create!(user: u3, event: e1, status: :confirmed)
e1.update!(available_capacity: 2)

Registration.create!(user: u1, event: e2, status: :confirmed)
Registration.create!(user: u2, event: e2, status: :confirmed)
Registration.create!(user: u3, event: e2, status: :confirmed)
Registration.create!(user: u4, event: e2, status: :confirmed)
Registration.create!(user: u5, event: e2, status: :waiting)  
e2.update!(available_capacity: 0)

Registration.create!(user: u1, event: e3, status: :confirmed)
Registration.create!(user: u2, event: e3, status: :confirmed)
Registration.create!(user: u4, event: e3, status: :confirmed)
Registration.create!(user: u5, event: e3, status: :confirmed)
e3.update!(available_capacity: 1)

Registration.create!(user: u1, event: e4, status: :confirmed)
Registration.create!(user: u3, event: e4, status: :confirmed)
e4.update!(available_capacity: 2)

Registration.create!(user: u1, event: e6, status: :confirmed)
Registration.create!(user: u2, event: e6, status: :confirmed)
Registration.create!(user: u3, event: e6, status: :confirmed)
Registration.create!(user: u4, event: e6, status: :confirmed)
Registration.create!(user: u5, event: e6, status: :confirmed)

puts "Created #{Registration.count} registrations"

puts "\nUpdating past event..."
e6.update!(
  start_date: Time.current - 5.days,
  end_date: Time.current - 4.days,
  lifecycle_stage: :completed
)

puts "Updated event '#{e6.title}' to past dates (completed)"
puts "\n Creating reviews..."

Review.create!(
  user: u1,
  event: e6,
  rating: 5,
  comment: "Amazing party! The music was great and the atmosphere was incredible."
)

Review.create!(
  user: u2,
  event: e6,
  rating: 4,
  comment: "Really enjoyed it! The venue was perfect."
)

Review.create!(
  user: u3,
  event: e6,
  rating: 5,
  comment: "Best New Year's celebration ever!"
)

Review.create!(
  user: u4,
  event: e6,
  rating: 4,
  comment: "Great organization, will definitely come back."
)

puts "Created #{Review.count} reviews"
puts "SEEDING COMPLETED SUCCESSFULLY!"