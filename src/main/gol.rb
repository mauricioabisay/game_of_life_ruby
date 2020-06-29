require_relative './grid.rb'

class GameOfLife
  attr_accessor :grid, :seedCells
  def initialize(grid = Grid.new, seedCells = Array.new)
    @grid = grid
    @seedCells = seedCells
    @seedCells.each do |aliveCell|
      @grid.cells[aliveCell[0]][aliveCell[1]].alive = true
    end
  end
end