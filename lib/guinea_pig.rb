require "active_record"
require_relative "guinea_pig/version"
require_relative "guinea_pig/ab_test"
require_relative "guinea_pig/experiments"

module GuineaPig
  def self.get(experiment, guinea_pig)
    ::GuineaPig::ABTest.where(:experiment => experiment, :guinea_pig_id => guinea_pig.id, :guinea_pig_type => guinea_pig.class.name).first_or_create
  end

  def self.alternative(experiment, guinea_pig)
    ab_test = get(experiment, guinea_pig)
    ab_test.increment!(:seen_count)
    ab_test.alternative
  end

  def self.conversion(experiment, guinea_pig)
    ab_test = get(experiment, guinea_pig)
    ab_test.conversion!
  end
end