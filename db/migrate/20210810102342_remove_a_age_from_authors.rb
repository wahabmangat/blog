class RemoveAAgeFromAuthors < ActiveRecord::Migration[6.1]
  def change
    remove_column :authors, :a_age
  end
end
