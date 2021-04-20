class CreateDialogCheckers < ActiveRecord::Migration[5.1]
  def change
    create_table :dialog_checkers do |t|
      t.boolean :lock
      t.string :image
      t.timestamps
    end
  end
end
