#!/usr/bin/env ruby
require_relative '../config/environment'

puts "=== Admin User Seeder ==="

username = "biaratiyatro@gmail.com"
password = "biaratiyatroadmin123."

puts "Checking for existing admin user '#{username}'..."
existing_user = AdminUser.find_by_username(username)

if existing_user
  puts "✅ Admin user '#{username}' already exists."
  # Optional: Update password if needed
  # existing_user.password = password
  # existing_user.save
  # puts "Updated password for '#{username}'."
else
  puts "Creating new admin user '#{username}'..."
  user = AdminUser.new(username: username)
  user.password = password
  
  if user.save
    puts "✅ Admin user created successfully!"
    puts "Username: #{username}"
    puts "Password: #{password}"
  else
    puts "❌ Failed to create admin user."
  end
end
