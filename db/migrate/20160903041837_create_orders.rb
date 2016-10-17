class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :ordering_id, index: true
      t.string :ordering_type, index: true

    end
  end
end
