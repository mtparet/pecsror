class ChangeOrderToOrderSequence < ActiveRecord::Migration
  def change
    remove_column :sequence_listes, :order
    add_column :sequence_listes, :order_sequence, :integer
  end
end
