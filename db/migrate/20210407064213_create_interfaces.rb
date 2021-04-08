class CreateInterfaces < ActiveRecord::Migration[6.1]
  def change
    create_table :interfaces do |t|
      t.text :name
      t.integer :hp
      t.integer :mp

      t.timestamps
    end
  end
end
