class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.integer :player_one_id
      t.integer :player_two_id
      t.integer :player_one_score
      t.integer :player_two_score

      t.timestamps null: false
    end
  end
end
