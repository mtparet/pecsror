class DeleteLocationToImages < ActiveRecord::Migration
  def change
    remove_column :images, :location
  end
end
