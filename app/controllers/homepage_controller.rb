class HomepageController < ApplicationController
  def index
    @mine_boards = MineBoard.order(created_at: :desc).limit(10)
  end
end
