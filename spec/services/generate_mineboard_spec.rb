require 'rails_helper'

RSpec.describe GenerateMineboard, type: :service do
  let(:name) { "Some name" }
  let(:creator_email) { "a@a.com" }
  let(:width) { 10 }
  let(:height) { 9 }
  let(:mines) { 10 }
  let(:service) do
    described_class.call(
      name: name,
      width: width,
      height: height,
      mines: mines,
      creator_email: creator_email
    )
  end

  context 'invalid params' do
    context 'name is invalid' do
      let(:name) { nil }

      it 'returns failed' do
        expect(service.success?).to eq(false)
        expect(service.first_error.message).to eq("Name can't be blank")
      end
    end

    context 'creator_email is invalid' do
      let(:creator_email) { "aaa" }

      it 'returns failed' do
        expect(service.success?).to eq(false)
        expect(service.first_error.message).to eq("Creator email is invalid")
      end
    end

    context 'mines is greater than cells' do
      let(:mines) { 101 }

      it 'returns failed' do
        expect(service.success?).to eq(false)
        expect(service.first_error.message).to eq("Mines cannot be greater than number of cells")
      end
    end
  end

  context 'valids params' do
    it 'returns success' do
      expect(service.success?).to eq(true)
      mine_board = service.mine_board
      expect(mine_board.mines).to eq(mines)
      expect(mine_board.width).to eq(width)
      expect(mine_board.height).to eq(height)
      expect(mine_board.mines_positions.max).to be < width * height
    end
  end
end
