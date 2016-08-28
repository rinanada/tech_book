class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.timestamps
      t.integer :postalcode
      t.text :place
      t.integer :callnumber
      t.references :user, index: true
    end
  end
end
