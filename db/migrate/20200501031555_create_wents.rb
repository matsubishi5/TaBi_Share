class CreateWents < ActiveRecord::Migration[5.2]
  def change
    create_table :wents do |t|
      t.integer :user_id, null: false
      t.integer :tourist_spot_id, null: false
      t.timestamps
    end
  end
end
