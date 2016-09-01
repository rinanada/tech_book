class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|

      t.timestamps
      t.references :user, index: true
      t.references :buying, index: true
      t.references :category, index: true
      t.references :profiles, index: true
      t.string :title
      t.string :sub_title
      t.integer :price
      t.integer :state
      t.text :discription
      t.text :content
    end
  end
end
