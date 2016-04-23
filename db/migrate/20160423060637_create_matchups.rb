class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.integer :player_one_id, index: true
      t.integer :player_two_id, index: true
      t.integer :player_one_score, default: 0, index: true
      t.integer :player_two_score, default: 0, index: true

      t.timestamps null: false
    end
  end
end
