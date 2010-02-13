# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_theglamourist_session',
  :secret      => 'db1dde1e180f547d0ffe5ee8eb55ee2c077f0b83e66ba8fe19e214613bab39b500193cd11c793eeb444afc7c721b1d93a62d703152b6189f69a1e345b1eb1384',
  :expire_after => 1.week
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
