class MineBoardsController < ApplicationController
  before_action :set_mine_board, only: %i[ show edit update destroy ]

  # GET /mine_boards or /mine_boards.json
  def index
    @mine_boards = MineBoard.order(:created_at).page(params[:page]).per(params[:per])
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
    service = GenerateMineboard.call(
      name: mine_board_params[:name],
      height: mine_board_params[:height],
      width: mine_board_params[:width],
      mines: mine_board_params[:mines],
      creator_email: mine_board_params[:creator_email]
    )
    @mine_board = service.mine_board

    respond_to do |format|
      if service.success?
        format.html { redirect_to mine_board_url(service.mine_board), notice: "Mine board was successfully created." }
        format.json { render :show, status: :created, location: service.mine_board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: service.mine_board.errors, status: :unprocessable_entity }
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

    def mine_board_params
      params.require(:mine_board).permit(:height, :width, :mines, :creator_email, :name)
    end
end
