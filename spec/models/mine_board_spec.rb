require 'rails_helper'

RSpec.describe MineBoard, type: :model do
  it { is_expected.to validate_presence_of(:creator_email) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.not_to allow_value('aaa').for(:creator_email) }
  it { is_expected.to validate_numericality_of(:mines).is_greater_than_or_equal_to(1)  }
  it { is_expected.to validate_numericality_of(:width).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(50) }
  it { is_expected.to validate_numericality_of(:height).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(50) }
end
