#!/usr/bin/env ruby
require_relative '../config/environment'

puts "=== Firebase Auth Debugger ==="
puts "Checking Environment Variables..."

api_key = ENV['FIREBASE_API_KEY']
if api_key.present?
  puts "✅ FIREBASE_API_KEY found: #{api_key[0..5]}...#{api_key[-5..-1]}"
else
  puts "❌ FIREBASE_API_KEY is MISSING or EMPTY!"
  puts "Please add it to your .env file."
  exit
end

print "\nEnter Email: "
email = gets.chomp
print "Enter Password: "
password = gets.chomp

puts "\nAttempting to sign in..."

begin
  response = FirebaseAuthService.sign_in(email, password)
  
  if response
    puts "\n✅ Login SUCCESSFUL!"
    puts "User ID: #{response['localId']}"
    puts "Email: #{response['email']}"
  else
    puts "\n❌ Login FAILED!"
    puts "Check Rails logs for details."
  end
rescue => e
  puts "\n❌ Exception: #{e.message}"
end
