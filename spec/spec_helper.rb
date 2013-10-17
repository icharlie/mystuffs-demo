# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require "capybara/rspec"
require "email_spec"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# module ControllerHelpers
#   def sign_in(user = double('user'))
#     if user.nil?
#       @request.env['warden'].stub(:authenticate!).
#         and_throw(:warden, {:scope => :user})
#       controller.stub :current_user => nil
#     else
#       @request.env['warden'].stub :authenticate! => user
#       controller.stub :current_user => user
#     end
#   end
# end

# module RequestHelpers
#   def sign_in
#     begin
#       fake = create(:user)
#     rescue Exception => e
#       fake = build_stubbed(:user)
#     end
#     user = mock_model(User, {:email => fake.email, :password => fake.password})
#     post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
#   end
# end


RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
  include ActionDispatch::TestProcess
  config.include Devise::TestHelpers, :type => :controller
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end
