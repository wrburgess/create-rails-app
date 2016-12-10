class InitialMigration < ActiveRecord::Migration[5.0]
  def change
    enable_extension "pgcrypto" unless extension_enabled?("pgcrypto")
  end
end
