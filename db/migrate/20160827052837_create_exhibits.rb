class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|

      t.timestamps
      t.string :title
      t.string :sub_title
      t.integer :price
      t.integer :state
      t.references :user, index: true
      t.references :profile, index: true
      # t.references :category, index: true

    end
  end
end
