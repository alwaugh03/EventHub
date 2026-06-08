
# README

Repository made by Alfonso Waugh and Francisco Langlois

This repository contains: 

* All the ruby files to be run in their respective folders

* An aditional folder containing the documents required for all asignments, this includes current and past model diagrams labeled by version

To run, all the contents of the repository should be put in a single folder and run there

# Administrators
admin = User.create!(
  email: "admin@test.com",
  role: :admin,
  password: "admin123",
  password_confirmation: "admin123",
  first_name: "Admin",
  last_name: "User",
  phone: "+56911111111"
)

# Regular Users
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

## Roles and Permissions
The platform uses role-based access control with two roles:

- Regular users: Can create events, register for events, leave reviews on events they attended, and manage their own events and registrations.
 -Administrators: Have all regular user permissions plus the ability to moderate the platform — edit or remove any event, manage venues and categories, and manage users.
