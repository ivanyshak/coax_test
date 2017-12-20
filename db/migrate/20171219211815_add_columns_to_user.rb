class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :is_female, :boolean, default: false
  	add_column :users, :date_of_birth, :datetime
  	add_column :users, :country, :string
  	add_column :users, :admin, :boolean, default: false
  end
end
