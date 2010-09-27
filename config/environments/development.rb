AuthlogicRails3Example::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  config.active_support.deprecation = :stderr

  config.autoload_paths = ["lib"]

  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  # See
  # http://ionrails.com/2009/07/27/sending-mail-via-gmail-with-rails-actionmailer/

  require 'tlsmail' #key but not always described
  Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)


  gmail_user = ENV['GMAIL_USER']
  puts "Please set GMAIL_USER in environment" unless gmail_user

  gmail_pass = ENV['GMAIL_PASSWORD']
  puts "Please set GMAIL_PASSWORD in environment" unless gmail_pass

  if gmail_user and gmail_pass
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.raise_delivery_errors = true
    ActionMailer::Base.smtp_settings = {
      :enable_starttls_auto => true,  #this is the important shit!
      :address        => 'smtp.gmail.com',
      :port           => 587,
      :domain         => 'xtargets.com',
      :authentication => :plain,
      :user_name      => gmail_user,
      :password       => gmail_pass
    }
  end

end
