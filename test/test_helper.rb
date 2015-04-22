ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'database_cleaner'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
DatabaseCleaner.strategy = :truncation

module ActionDispatch
  class IntegrationTest
    def setup
      DatabaseCleaner.start
    end

    def teardown
      DatabaseCleaner.clean
    end
  end
end
