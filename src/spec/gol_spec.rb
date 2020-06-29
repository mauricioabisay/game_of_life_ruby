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
    it 'has rows' do
      expect(subject).to respond_to(:rows)
      expect(subject.rows).to be_instance_of Integer
    end
    it 'has cols' do
      expect(subject).to respond_to(:cols)
      expect(subject.cols).to be_instance_of Integer
    end
    it 'has a cells matrix' do
      expect(subject).to respond_to(:cells)
      expect(subject.cells).to be_instance_of Array
      expect(subject.cells.length()).to equal(subject.rows)
      subject.cells.each do |row|
        expect(row).to be_instance_of Array
        expect(row.length()).to equal(subject.cols)
        row.each do |col|
          expect(col).to be_instance_of Cell
        end
      end
    end
    it 'has a neighbours counter' do
      expect(subject).to respond_to(:neighbours_alive_counter)
      expect(subject.neighbours_alive_counter).to be_instance_of Integer
      expect(subject.neighbours_alive_counter(subject.cells[-1][-1])).to be_instance_of Integer
    end
  end

  context 'Game' do
    subject {GameOfLife.new}
    it 'create a new Game object' do
      expect(subject).to be_instance_of GameOfLife
    end
    it 'has a grid' do
      expect(subject.grid).to be_instance_of Grid
    end
    it 'has alive seed cells array' do
      expect(subject.seedCells).to be_instance_of Array
    end
    it 'seed alive cells into the grid' do
      game = GameOfLife.new(Grid.new, [ [1,1], [2,2] ])
      cell = game.grid.cells[1][1]
      expect(cell.isAlive?).to equal(true)
      expect(game.grid.neighbours_alive_counter(cell)).to equal(1)
      expect(game.grid.cells[2][2].alive).to equal(true)
    end
  end

end