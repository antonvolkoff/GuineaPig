require "rails/generators"

class GuineaPig::MigrationGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  desc "Generates migration for ABTest model"

  def self.source_root
    File.join(File.dirname(__FILE__), "templates")
  end

  def self.next_migration_number(dirname) #:nodoc:
    migration_number_attempt = Time.now.utc.strftime("%Y%m%d%H%M%S")

    if ActiveRecord::Base.timestamped_migrations && migration_number_attempt > current_migration_number(dirname).to_s
      migration_number_attempt
    else
      serial_migration_number(dirname)
    end
  end

  def copy_migration
    migration_template "create_ab_tests.rb", "db/migrate/create_ab_tests.rb"
  end
end