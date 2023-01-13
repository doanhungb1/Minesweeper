class MineBoard < ApplicationRecord
  validates :name, presence: true
  validates :width, :numericality => { greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
  validates :height, :numericality => { greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
  validates :mines, presence: true, :numericality => { greater_than_or_equal_to: 1 }
  validates :creator_email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
end
