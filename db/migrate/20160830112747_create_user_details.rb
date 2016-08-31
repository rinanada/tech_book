class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|

      t.timestamps
      t.string :lastname
      t.string :firstname
      t.integer :postalcode
      t.integer :callnumber
      t.integer :place
    end
  end
end
