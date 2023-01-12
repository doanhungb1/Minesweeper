class GenerateMineboard < BaseService
  attr_reader :name, :width, :height, :mines, :creator_email, :mine_positions, :mine_board
  def initialize(name:, width:, height:, mines:, creator_email:)
    @width= width
    @height= height
    @mines= mines
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
      mine_positions: assigned_mine_positions,
      name: name
    )

    unless @mine_board.save
      add_error(@mine_board.errors)
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

  def generate_mine_positions
    return if mines <= assigned_mine_positions.count

    mine_x = Random.rand(width)
    mine_y = Random.rand(height)
    mine_position = { mine_x: mine_x, mine_y: mine_y }
    assigned_mine_positions << mine_position unless already_assigned? mine_position
    puts mine_position
    generate_mine_positions
  end

  def assigned_mine_positions
    @assigned_mine_positions ||= []
  end

  def already_assigned? mine_position
    assigned_mine_positions.include? mine_position
  end

  def total_cells
    total_cells ||= width * height
  end
end
