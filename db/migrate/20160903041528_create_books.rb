class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|

      t.timestamps
      t.references :user, index: true
      t.references :profiles, index: true
      t.string :title
      t.string :sub_title
      t.integer :price
      t.integer :state
      t.text :description
      t.integer :likes_count
      t.string :content
      t.string :sold?
      t.integer :likes_count
      t.integer :o_user_id
      t.integer :e_user_id
      t.integer :pay_method
      t.integer :user_detail_id
    end
  end
end


# enum pay_method: { credit: 0, bank: 1, still: 2}でsold?カラムは消去できる
