class AddCategorieForeignKeys < ActiveRecord::Migration
	def self.up
	add_column :images, :categorie_id, :integer
	end
	def self.down
	remove_column :images, :categorie_id
	end

end
