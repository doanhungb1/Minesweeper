class MineBoardsController < ApplicationController
  before_action :set_mine_board, only: %i[ show edit update destroy ]

  # GET /mine_boards or /mine_boards.json
  def index
    @mine_boards = MineBoard.all
  end

  # GET /mine_boards/1 or /mine_boards/1.json
  def show
  end

  # GET /mine_boards/new
  def new
    @mine_board = MineBoard.new
  end

  # GET /mine_boards/1/edit
  def edit
  end

  # POST /mine_boards or /mine_boards.json
  def create
    @mine_board = MineBoard.new(mine_board_params)

    respond_to do |format|
      if @mine_board.save
        format.html { redirect_to mine_board_url(@mine_board), notice: "Mine board was successfully created." }
        format.json { render :show, status: :created, location: @mine_board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mine_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mine_boards/1 or /mine_boards/1.json
  def update
    respond_to do |format|
      if @mine_board.update(mine_board_params)
        format.html { redirect_to mine_board_url(@mine_board), notice: "Mine board was successfully updated." }
        format.json { render :show, status: :ok, location: @mine_board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mine_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mine_boards/1 or /mine_boards/1.json
  def destroy
    @mine_board.destroy

    respond_to do |format|
      format.html { redirect_to mine_boards_url, notice: "Mine board was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mine_board
      @mine_board = MineBoard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mine_board_params
      params.fetch(:mine_board, {})
    end
end
