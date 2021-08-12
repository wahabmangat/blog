class AddAgeToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :integer
  end
end
