Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY']
}
Rails.configuration.admin = {
  :username => ENV['ADMIN_USERNAME'],
  :userpassword => ENV['ADMIN_PASSWORD']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
