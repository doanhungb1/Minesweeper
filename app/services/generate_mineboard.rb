class GenerateMineboard < BaseService
  attr_reader :name, :width, :height, :mines, :creator_email, :mine_positions, :mine_board
  def initialize(name:, width:, height:, mines:, creator_email:)
    @width= width.to_i
    @height= height.to_i
    @mines= mines.to_i
    @creator_email= creator_email
    @name = name
  end

  def call
    return self unless valid?

    generate_mine_positions

    @mine_board = MineBoard.new(
      width: width,
      height: height,
      mines: mines,
      creator_email: creator_email,
      mines_positions: assigned_mines_positions,
      name: name
    )

    unless @mine_board.save
      add_error(@mine_board.errors.full_messages)
    end

    self
  end

  private

  def valid?
    if mines > total_cells
      add_error(I18n.t('mine_board.mines_number_error')) and return false
    end

    true
  end
  # randIndex = -~( Math.random() * this.safeCells.length ) - 1;
  # this.mineCells.push( this.safeCells[randIndex] );
  # this.safeCells.splice( randIndex, 1 ); // remove cell from array of safe cells
  def generate_mine_positions
    return if mines <= assigned_mines_positions.count

    random_safe_cell_index = Random.rand(safe_cells.length)

    assigned_mines_positions << safe_cells[random_safe_cell_index]
    safe_cells.delete_at(random_safe_cell_index)
    generate_mine_positions
  end

  def assigned_mines_positions
    @assigned_mines_positions ||= []
  end

  def safe_cells
    @safe_cells ||= Array (1..total_cells)
  end

  def total_cells
    total_cells ||= width * height
  end
end
