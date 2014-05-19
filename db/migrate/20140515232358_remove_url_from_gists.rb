class RemoveUrlFromGists < ActiveRecord::Migration
  def up
    remove_column :gists, :url
  end

  def down
    add_column :gists, :string, :url, null: false
  end
end
