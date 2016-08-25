class CreateExibits < ActiveRecord::Migration
  def change
    create_table :exibits do |t|

      t.timestamps
      t.string :title
      t.string :sub_title
      t.integer :price
      t.integer :state
      t.integer :user_id
      t.integer :category_id
    end
  end
end
