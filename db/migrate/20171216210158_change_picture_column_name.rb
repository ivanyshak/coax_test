class ChangePictureColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :pictures, :name, :image_url
  end
end
