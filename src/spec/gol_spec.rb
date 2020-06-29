require_relative '../main/cell.rb'
require_relative '../main/grid.rb'
require_relative '../main/gol.rb'

describe 'Game of Life' do
  context 'Cell' do
    subject {Cell.new}
    it 'create a new Cell object' do
      expect(subject).to be_instance_of Cell
    end
    it 'check if cell is alive' do
      expect(subject).to respond_to(:alive)
      expect(subject.alive).to equal(false)
      expect(subject).to respond_to(:isAlive?)
      expect(subject.isAlive?).to equal(false)
    end
    it 'has current cell row' do
      expect(subject).to respond_to(:row)
      expect(subject.row).to be_instance_of Integer
    end
    it 'has current cell column' do
      expect(subject).to respond_to(:col)
      expect(subject.col).to be_instance_of Integer
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