class AddRefToExhibits < ActiveRecord::Migration
  def change
    add_reference :exhibits, :category, index: true, foreign_key: true
  end
end
