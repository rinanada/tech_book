class CreateBuyings < ActiveRecord::Migration
  def change
    create_table :buyings do |t|

      t.timestamps
      t.references :user, index: true
    end
  end
end
