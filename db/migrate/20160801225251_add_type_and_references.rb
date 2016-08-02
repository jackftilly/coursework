class AddTypeAndReferences < ActiveRecord::Migration
  def change
    add_column :comments, :external_type, :string
  end
end
