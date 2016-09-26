class AddFavFromOwner < ActiveRecord::Migration
  def change
    add_column :contacts, :favorite, :integer
  end
end
