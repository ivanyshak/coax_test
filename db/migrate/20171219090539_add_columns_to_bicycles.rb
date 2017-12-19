class AddColumnsToBicycles < ActiveRecord::Migration[5.1]
  def change
    add_column :bicycles, :category_id, :integer
  end
end
