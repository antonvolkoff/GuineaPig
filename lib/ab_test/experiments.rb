module ABTest
  module Experiments
    def self.pick_alternative(experiment)
      experiments[experiment].sample
    end

    def self.experiments
      @experiments ||= load_experiments(experiments_path)
    end

    def self.load_experiments(path)
      @experiments = YAML::load(File.open(path)).symbolize_keys
    end

    def self.experiments_path
      "#{Rails.root}/config/ab_experiments.yml"
    end
  end
end