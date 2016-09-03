class DropBuying < ActiveRecord::Migration
  def change
    drop_table :buyings
  end
end
