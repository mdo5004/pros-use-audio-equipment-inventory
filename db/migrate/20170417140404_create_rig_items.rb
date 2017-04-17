class CreateRigItems < ActiveRecord::Migration[5.0]
  def change
    create_table :rig_items do |t|
      t.integer :rig_id
      t.integer :item_id

      t.timestamps
    end
  end
end
