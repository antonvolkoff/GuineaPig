module GuineaPig
  module Experiments
    def self.pick_alternative(experiment)
      experiments[experiment].sample
    end

    def self.experiments
      @experiments ||= YAML::load(File.open(experiments_path)).symbolize_keys
    end

    def self.experiments_path
      "#{Rails.root}/config/ab_experiments.yml"
    end
  end
end