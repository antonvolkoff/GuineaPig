require "#{File.dirname(__FILE__)}/test/test_helper"
ABTest::Experiments.load_experiments("#{File.dirname(__FILE__)}/test/fixtures/ab_experiments.yml")
guinea_pig = GuineaPig.create!
ABTest::ABTest.create!(:experiment => :experiment_monkey, :guinea_pig => guinea_pig)