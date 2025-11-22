require_relative '../config/environment'

puts "Seeding Admin User..."

username = "admin"
password = "password123"

# Check if admin already exists
existing_admin = AdminUser.find_by_username(username)

if existing_admin
  puts "Admin user '#{username}' already exists."
else
  admin = AdminUser.new(username: username)
  admin.password = password
  
  if admin.save
    puts "✅ Admin user created successfully!"
    puts "Username: #{username}"
    puts "Password: #{password}"
  else
    puts "❌ Failed to create admin user."
  end
end
