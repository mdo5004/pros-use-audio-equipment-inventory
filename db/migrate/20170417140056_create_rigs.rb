class CreateRigs < ActiveRecord::Migration[5.0]
  def change
    create_table :rigs do |t|
      t.string :name
      t.integer :user_id
      t.string :venue
      t.integer :use

      t.timestamps
    end
  end
end
