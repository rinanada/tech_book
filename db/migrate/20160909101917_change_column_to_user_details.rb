class ChangeColumnToUserDetails < ActiveRecord::Migration
  def change
    change_column :user_details, :place, :text
  end
end
