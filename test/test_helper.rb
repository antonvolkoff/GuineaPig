require "minitest/unit"
require "minitest/autorun"
require "mocha/setup"
require "assert_difference"
require_relative "../lib/ab_test"

FileUtils.rm("#{File.dirname(__FILE__)}/db/ab_test.sqlite")

ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => "#{File.dirname(__FILE__)}/db/ab_test.sqlite"
)

require_relative "../rails/generators/ab_test/templates/create_ab_tests"
CreateABTests.up

load("#{File.dirname(__FILE__)}/schema.rb")
load("#{File.dirname(__FILE__)}/models.rb")

class MiniTest::Unit::TestCase
  include AssertDifference
  FIXTURES = File.expand_path("#{File.dirname(__FILE__)}/fixtures")
end

