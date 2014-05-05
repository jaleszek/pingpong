class CreateGistsChallenges < ActiveRecord::Migration
  def change
    create_table :gists_challenges do |t|
      t.integer :parent_gist_id, null: false
      t.integer :challenge_gist_id, null: false
    end

    add_index :gists_challenges, [:parent_gist_id, :challenge_gist_id], unique: true
    add_index :gists_challenges, :challenge_gist_id
  end
end
