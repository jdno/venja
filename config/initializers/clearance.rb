# frozen_string_literal: true

Clearance.configure do |config|
  config.mailer_sender = "hi@venja.app"
  config.rotate_csrf_on_sign_in = true
  config.secure_cookie = Rails.env.production?
end
