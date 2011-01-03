# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Bubo-API-Example_session',
  :secret      => 'fa8a3500011d3c2119e8df9900b26ab030e93dd4286ebe2ddd967ffffca09884099c48e0c698b9ff22a829012162f31421e47f4a4f1da5514bfd41d58917d825'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
