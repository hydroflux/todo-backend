class CreateToDos < ActiveRecord::Migration[6.1]
  def change
    create_table :to_dos do |t|
      t.string :title
      t.text :content
      t.boolean :urgent
      t.boolean :done

      t.timestamps
    end
  end
end
