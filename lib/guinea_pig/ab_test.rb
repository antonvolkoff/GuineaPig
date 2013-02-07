module GuineaPig
  class ABTest < ::ActiveRecord::Base
    before_validation :initialize_alternative, :on => :create

    attr_accessible :experiment, :guinea_pig, :alternative

    validates :alternative, :presence => true
    validates :guinea_pig_id, :presence => true
    validates :guinea_pig_type, :presence => true
    validates :experiment, :presence => true
    validates :experiment, :uniqueness => {:scope => [:guinea_pig_id, :guinea_pig_type]}

    belongs_to :guinea_pig, :polymorphic => true

    def conversion!
      increment!(:conversion_count)
    end

    def initialize_alternative
      self.alternative ||= ::GuineaPig::Experiments.pick_alternative(experiment)
    end
  end
end