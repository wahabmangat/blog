class AddAgeToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :a_age, :integer
  end
end
