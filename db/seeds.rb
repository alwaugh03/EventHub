# Users
users = 5.times.map do |i|
  User.create!(
    first_name: "User#{i}",
    last_name: "Test",
    email: "user#{i}@mail.com"
  )
end

# Admins
admins = 2.times.map do |i|
  Administrator.create!(
    first_name: "Admin#{i}",
    last_name: "Boss",
    email: "admin#{i}@mail.com"
  )
end

# Events
events = 3.times.map do |i|
  Event.create!(
    title: "Event #{i}",
    description: "Description #{i}",
    start_date: Time.now,
    end_date: Time.now + 1.day,
    maximum_capacity: 100,
    available_capacity: 50,
    lifecycle_stage: :published
  )
end

# Relations
events.each do |event|
  users.sample(3).each do |user|
    UserEvent.create!(user: user, event: event)
  end

  admins.each do |admin|
    AdministratorEvent.create!(administrator: admin, event: event)
  end
end

# Reviews
events.each do |event|
  users.each do |user|
    Review.create!(
      user: user,
      event: event,
      calification: rand(1.0..5.0),
      comment: "Great event!"
    )
  end
end