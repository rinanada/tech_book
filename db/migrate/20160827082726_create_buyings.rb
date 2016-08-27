class CreateBuyings < ActiveRecord::Migration
  def change
    create_table :buyings do |t|

      t.timestamps
      t.integer :exhibit_id
      t.integer :user_id
    end
  end
end
