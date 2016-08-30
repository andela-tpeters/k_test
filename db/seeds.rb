role_list = [
  "admin",
  "passenger"
]

role_list.each do |role|
  Role.create(name: :role)
end