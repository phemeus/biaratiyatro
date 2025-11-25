require 'net/http'
require 'uri'
require 'json'

class FirebaseAuthService
  BASE_URL = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword"

  def self.sign_in(email, password)
    api_key = FIREBASE_API_KEY
    return nil unless api_key

    uri = URI("#{BASE_URL}?key=#{api_key}")
    
    response = Net::HTTP.post_form(uri, {
      "email" => email,
      "password" => password,
      "returnSecureToken" => "true"
    })

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      Rails.logger.error "Firebase Auth Error: #{response.body}"
      nil
    end
  rescue StandardError => e
    Rails.logger.error "Firebase Auth Exception: #{e.message}"
    nil
  end
end
