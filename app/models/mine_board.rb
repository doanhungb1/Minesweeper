class MineBoard < ApplicationRecord
  validates :name, presence: true
  validates :width, :numericality => { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :height, :numericality => { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :mines, presence: true
end
