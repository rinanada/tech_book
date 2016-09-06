class ChangeColumnToBook < ActiveRecord::Migration
  def change
    remove_column :books, :order_user_id, :integer
    remove_column :books, :likes_count, :integer
    remove_column :books, :discription, :text
    add_column :books, :description, :text
  end
end
