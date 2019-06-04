# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  role = Role.create(name: Faker::Name.unique.name)
  NotificationTemplate.create(name: Faker::Name.unique.name, role_id: role.id )
end

3.times do
  Company.create(name: Faker::Company.name, role_id: Role.first.id)
end
