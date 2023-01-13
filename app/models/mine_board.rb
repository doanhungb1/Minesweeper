class MineBoard < ApplicationRecord
  validates :name, presence: true
  validates :width, :numericality => { greater_than_or_equal_to: 1, less_than_or_equal_to: 20 }
  validates :height, :numericality => { greater_than_or_equal_to: 1, less_than_or_equal_to: 20 }
  validates :mines, presence: true, :numericality => { greater_than_or_equal_to: 1 }
  validates :creator_email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/

  def visualize
    # height.times do |y|
    #   width.times do |x|
    #     if mines_positions.include?({"mine_x" => x, "mine_y" => y})
    #       print('1 ')
    #     else
    #       print('0 ')
    #     end
    #   end
    #   puts ""
    # end
  end
end
