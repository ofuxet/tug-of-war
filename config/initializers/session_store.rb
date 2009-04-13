# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_corde_session',
  :secret      => '2600bb00978c010e0501c129081bd9019c68d17c8e0914226198bd683f565f7cab44bd7532addda37f5fa05d36795d6ffe0f7faeca8ba1ae48168ead738fadee'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
