# CREATE Users
puts "BEGIN: Create users"
(1..10).each do
  User.seed(roles: [UserRoles::CUSTOMER], dummy: true)
end
puts "END:   Create users"
