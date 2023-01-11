class CreateMineBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :mine_boards do |t|
      t.integer :width, null: false
      t.integer :height, null: false
      t.integer :mines, null: false
      t.json :mine_positions
      t.timestamps
    end
  end
end
