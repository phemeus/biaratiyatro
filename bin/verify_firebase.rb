require_relative '../config/environment'

puts "Verifying Firebase Connection..."

begin
  # Attempt to create a test record
  test_ref = $firebase.push('verify_connection', { timestamp: Time.now.to_i, message: 'Hello from Rails' })
  
  if test_ref.success?
    puts "✅ Write successful! ID: #{test_ref.body['name']}"
    
    # Attempt to read it back
    read_ref = $firebase.get("verify_connection/#{test_ref.body['name']}")
    if read_ref.success? && read_ref.body['message'] == 'Hello from Rails'
      puts "✅ Read successful!"
      
      # Clean up
      $firebase.delete("verify_connection/#{test_ref.body['name']}")
      puts "✅ Delete successful!"
      puts "🎉 Firebase connection is working perfectly."
    else
      puts "❌ Read failed or data mismatch."
    end
  else
    puts "❌ Write failed. Response: #{test_ref.body}"
  end
rescue StandardError => e
  puts "❌ Error: #{e.message}"
  puts e.backtrace
end
