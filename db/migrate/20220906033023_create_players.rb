class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :room_id
      t.integer :prohibited_action_id
      t.integer :lives
      t.timestamps
    end
  end
end
