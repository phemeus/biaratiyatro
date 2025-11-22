require 'firebase'

# Initialize Firebase client
# We use the base URI provided by the user.
# Secrets should be in .env but for this public DB URL it's fine here or in env.
# Better to use ENV for flexibility.

FIREBASE_BASE_URI = ENV.fetch('FIREBASE_BASE_URI', 'https://biaratiyatro-a249a-default-rtdb.europe-west1.firebasedatabase.app/')

# We can create a global client instance
$firebase = Firebase::Client.new(FIREBASE_BASE_URI)
