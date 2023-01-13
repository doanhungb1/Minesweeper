class RemoveColumnMinePositions < ActiveRecord::Migration[6.1]
  def change
    remove_column :mine_boards, :mine_positions
  end
end
