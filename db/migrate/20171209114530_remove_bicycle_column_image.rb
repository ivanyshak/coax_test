class RemoveBicycleColumnImage < ActiveRecord::Migration[5.1]
  def change
    remove_column :bicycles, :image
  end
end
