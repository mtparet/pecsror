class ChangeImagesIdToImageId < ActiveRecord::Migration
  def change
    remove_column :sequences, :images_id
    remove_column :sequence_listes, :images_id
    add_column :sequences, :image_id, :integer
    add_column :sequence_listes, :image_id, :integer
  end
end
