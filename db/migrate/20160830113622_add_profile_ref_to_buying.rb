class AddProfileRefToBuying < ActiveRecord::Migration
  def change
    add_reference :buyings, :profile, index: true, foreign_key: true
  end
end
