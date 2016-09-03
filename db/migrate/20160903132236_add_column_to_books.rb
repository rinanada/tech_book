class AddColumnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :liks_count, :integer
  end
end
