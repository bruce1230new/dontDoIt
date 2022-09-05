class CreateProhibitedActions < ActiveRecord::Migration[7.0]
  def change
    create_table :prohibited_actions do |t|
      t.string :name
      t.timestamps
    end
  end
end
