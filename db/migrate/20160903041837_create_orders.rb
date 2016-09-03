class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.timestamps
      t.references :user, index: true
      t.references :book, index: true
      t.integer :position

    end
  end
end
