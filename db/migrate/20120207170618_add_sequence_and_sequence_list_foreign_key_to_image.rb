class AddSequenceAndSequenceListForeignKeyToImage < ActiveRecord::Migration
  def change
    add_column :images, :sequence_id, :integer
    add_column :images, :sequence_liste_id, :integer
  end
end
