class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|

      t.timestamps
      t.references :user, index: true
      t.references :profiles, index: true
      t.string :title
      t.string :sub_title
      t.integer :price
      t.integer :state
      t.text :discription
      t.integer :likes_count
      t.text :content
      t.string :sold?
    end
  end
end
