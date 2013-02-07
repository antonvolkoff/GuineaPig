require "active_record"
require_relative "ab_test/version"
require_relative "ab_test/ab_test"
require_relative "ab_test/experiments"

module ABTest
  def self.get(experiment, guinea_pig)
    ab_test = ::ABTest::ABTest.where(:experiment => experiment, :guinea_pig_id => guinea_pig.id, :guinea_pig_type => guinea_pig.class.name).first_or_create
    ab_test.increment!(:seen_count)
    ab_test
  end
end