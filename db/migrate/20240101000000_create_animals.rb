class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :emoji, null: false
      t.string :category, null: false
      t.string :fun_fact

      t.timestamps
    end
    add_index :animals, :category
  end
end
