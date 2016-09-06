class ChangeColumnToOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :position, :integer
    add_column :orders, :book_id, :integer
  end
end
