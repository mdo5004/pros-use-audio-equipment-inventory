class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :classification
      t.string :manufacturer
      t.string :make
      t.string :model
      t.integer :year
      t.string :link

      t.timestamps
    end
  end
end
