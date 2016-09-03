class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|

      t.timestamps
      t.references :book
    end
  end
end
