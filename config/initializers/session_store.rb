# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_realtimedemo_session',
  :secret => 'e117d7a635e7908a5d2c0e46b93eb648281127783cd72eabb1bb30d5015eb528810d5c680c52e6f9fed94650db6715ea67bd17887f1766b97645a09c5bd4755c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
