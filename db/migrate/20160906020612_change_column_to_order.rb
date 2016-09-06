class ChangeColumnToOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :position, :integer
    add_column :orders, :book_id, :integer
    add_column :orders, :pay_method, :integer
    # enum
  end
end
