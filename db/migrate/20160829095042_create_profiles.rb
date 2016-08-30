class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

      t.timestamps
      t.references :user, index: true
    end
  end
end
