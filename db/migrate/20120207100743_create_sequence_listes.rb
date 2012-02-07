class CreateSequenceListes < ActiveRecord::Migration
  def change
    create_table :sequence_listes do |t|
      t.integer :order
      t.integer :sequence_id
      t.integer :images_id

      t.timestamps
    end
  end
end
