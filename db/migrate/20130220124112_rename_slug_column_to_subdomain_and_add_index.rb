class RenameSlugColumnToSubdomainAndAddIndex < ActiveRecord::Migration
  def up
    rename_column :projects, :slug, :subdomain

    add_index :projects, :subdomain, :unique => true
  end

  def down
    rename_column :projects, :subdomain, :slug

    remove_index :projects, :subdomain
  end
end
