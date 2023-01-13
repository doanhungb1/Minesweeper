class AddColumnMinesPositions < ActiveRecord::Migration[6.1]
  def change
    add_column :mine_boards, :mines_positions, :integer, array: true, default: []
  end
end
