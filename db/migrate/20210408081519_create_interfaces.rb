class CreateInterfaces < ActiveRecord::Migration[5.1]
  def change
    create_table :interfaces do |t|
      t.text :name
      t.integer :hp
      t.integer :mp
      t.boolean :stop
      t.timestamps
    end
  end
end
