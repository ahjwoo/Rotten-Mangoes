RottenMangoes::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
end

SwitchUser.setup do |config|
  # provider may be :devise, :authlogic, :clearance, :restful_authentication or :sorcery
  config.provider = :devise

  # available_users is a hash,
  # key is the model name of user (:user, :admin, or any name you use),
  # value is a block that return the users that can be switched.
  config.available_users = { :user => lambda { User.all } } # use User.scoped instead for rails 3.2

  # available_users_identifiers is a hash,
  # keys in this hash should match a key in the available_users hash
  # value is the name of the identifying column to find by,
  # defaults to id
  # this hash is to allow you to specify a different column to
  # expose for instance a username on a User model instead of id
  config.available_users_identifiers = { :user => :id }

  # available_users_names is a hash,
  # keys in this hash should match a key in the available_users hash
  # value is the column name which will be displayed in select box
  config.available_users_names = { :user => :email }

  # controller_guard is a block,
  # if it returns true, the request will continue,
  # else the request will be refused and returns "Permission Denied"
  # if you switch from "admin" to user, the current_user param is "admin"
  config.controller_guard = lambda { |current_user, request| Rails.env.development? }

  # view_guard is a block,
  # if it returns true, the switch user select box will be shown,
  # else the select box will not be shown
  # if you switch from admin to "user", the current_user param is "user"
  config.view_guard = lambda { |current_user, request| Rails.env.development? }

  # redirect_path is a block, it returns which page will be redirected
  # after switching a user.
  config.redirect_path = lambda { |request, params| '/' }
end