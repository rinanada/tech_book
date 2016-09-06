class ChangeColumnToBook < ActiveRecord::Migration
  def change
    remove_column :books, :user_id, :integer
    remove_column :books, :discription, :text
    remove_column :books, :order_user_id, :integer
    add_column :books, :description, :text
    add_column :books, :e_user_id, :integer
    add_column :books, :o_user_id, :integer
  end
end
