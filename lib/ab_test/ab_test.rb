module ABTest
  class ABTest < ::ActiveRecord::Base
    before_validation :initialize_alternative, :on => :create

    attr_accessible :experiment, :guinea_pig, :alternative

    validates :alternative, :presence => true
    validates :guinea_pig_id, :presence => true
    validates :guinea_pig_type, :presence => true
    validates :experiment, :presence => true
    validates :experiment, :uniqueness => {:scope => [:guinea_pig_id, :guinea_pig_type]}

    belongs_to :guinea_pig, :polymorphic => true

    def self.get(experiment, guinea_pig)
      ab_test = ::ABTest::ABTest.where(:experiment => experiment, :guinea_pig_id => guinea_pig.id, :guinea_pig_type => guinea_pig.class.name).first_or_create
      ab_test.increment!(:seen_count)
      ab_test
    end

    def conversion!
      increment!(:conversion_count)
    end

    def initialize_alternative
      self.alternative ||= ::ABTest::Experiments.pick_alternative(experiment)
    end
  end
end