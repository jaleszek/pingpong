class CreateGistContents < ActiveRecord::Migration
  def change
    create_table :gist_contents do |t|
      t.string :normalized, null: false
      t.integer :gist_id, null: false
      t.integer :language_id
    end

    add_index :gist_contents, :gist_id
  end
end
