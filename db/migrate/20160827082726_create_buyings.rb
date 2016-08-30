class CreateBuyings < ActiveRecord::Migration
  def change
    create_table :buyings do |t|

      t.timestamps
      t.references :exhibit, index: true
      t.references :user, index: true
      t.references :profile, index: true
    end
  end
end
