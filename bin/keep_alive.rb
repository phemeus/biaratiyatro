#!/usr/bin/env ruby
require 'net/http'
require 'uri'

# Get the external URL from Render environment variable
# If not set (local development), default to localhost:3000
app_url = ENV.fetch('RENDER_EXTERNAL_URL', 'http://localhost:3000')
alive_endpoint = "#{app_url}/alive"

puts "[KeepAlive] Starting keep-alive worker for #{alive_endpoint}..."

loop do
  begin
    uri = URI.parse(alive_endpoint)
    response = Net::HTTP.get_response(uri)
    
    if response.is_a?(Net::HTTPSuccess)
      puts "[KeepAlive] Ping successful: #{response.code} #{response.message} at #{Time.now}"
    else
      puts "[KeepAlive] Ping failed: #{response.code} #{response.message} at #{Time.now}"
    end
  rescue StandardError => e
    puts "[KeepAlive] Error pinging #{alive_endpoint}: #{e.message}"
  end

  # Sleep for 5 minutes (300 seconds)
  # Render free tier sleeps after 15 mins of inactivity, so 5 mins is safe.
  sleep 300
end
