ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'factory_girl_rails'
require 'test/unit'

class Test::Unit::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  def setup
    @admin = FactoryGirl.create(:admin)

    #stub current_user with the default user
    if @controller
      @controller.stubs(:current_user).returns(@admin)
    end
  end

  # Add more helper methods to be used by all tests here...
end

require 'mocha/setup'