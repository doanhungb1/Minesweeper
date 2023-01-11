class CreateMineBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :mine_boards do |t|
      t.string :name, null: false
      t.string :creator_email, null: false
      t.integer :width, null: false
      t.integer :height, null: false
      t.integer :mines, null: false
      t.json :mine_positions
      t.timestamps
    end
  end
end
