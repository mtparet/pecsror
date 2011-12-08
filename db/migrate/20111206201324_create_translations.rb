class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
