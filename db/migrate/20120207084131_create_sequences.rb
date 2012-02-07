class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.string :name
      t.integer :images_id
      t.integer :sequence_liste_id
      t.timestamps
    end
  end
end
