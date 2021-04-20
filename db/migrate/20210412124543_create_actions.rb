class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.boolean :perform
      t.integer :action

      t.timestamps
    end
  end
end
