class CreateBuyings < ActiveRecord::Migration
  def change
    create_table :buyings do |t|
      t.timestamps
      t.integer :pay_method
      t.references :order
    end
  end
end
