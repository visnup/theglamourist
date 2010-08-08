ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rails/test_help'
require 'mocha/integration/test_unit'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class Mocha::Expectation
  def invoke
    @invocation_count += 1
    perform_side_effects()
    if block_given? then
      @yield_parameters.next_invocation.each do |yield_parameters|
        retval = yield(*yield_parameters)
        @return_values = Mocha::ReturnValues.build(retval) + @return_values
      end
    end
    @return_values.next
  end
end
