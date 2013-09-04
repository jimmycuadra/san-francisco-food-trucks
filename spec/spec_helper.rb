ENV["RAILS_ENV"] ||= 'test'
require 'securerandom'
ENV["SECRET_KEY_BASE"] ||= SecureRandom.hex(64)
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.before do
    Mongoid.default_session.collections.each do |col|
      col.drop unless /^system/.match(col.name)
    end
  end
end
