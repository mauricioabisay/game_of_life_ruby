require_relative '../main/cell.rb'
require_relative '../main/grid.rb'
require_relative '../main/gol.rb'

describe 'Game of Life' do
  context 'Cell' do
    subject {Cell.new}
    it 'create a new Cell object' do
      expect(subject).to be_instance_of Cell
    end
  end

  context 'Grid' do
    subject {Grid.new}
    it 'create a new Grid object' do
      expect(subject).to be_instance_of Grid
    end
  end

  context 'Game' do
    subject {GameOfLife.new}
    it 'create a new Game object' do
      expect(subject).to be_instance_of GameOfLife
    end
  end

end