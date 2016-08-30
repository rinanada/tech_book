class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

      t.timestamps
      t.integer :langage
      t.integer :design
      t.integer :other
    end
  end
end
