class DropExhibit < ActiveRecord::Migration
  def change
    drop_table :exhibits
  end
end
