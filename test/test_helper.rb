require "test/unit"
require "mocha"
require_relative "../lib/ab_test"

class Test::Unit::TestCase
  FIXTURES = File.expand_path( "#{File.dirname(__FILE__)}/fixtures" )

  def read_fixture( fixture_name )
    File.read( "#{FIXTURES}/#{fixture_name}" )
  end
end

