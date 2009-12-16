# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_societyforjustice_session',
  :secret      => '91052d68260bc46601fcd6929f3a72b9e5f6b4fa2063f69c209c76bda903849c02c5018917d51f4c92a742c55ccdfbb55b5b72096081369ac341811c3e6aafe9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
