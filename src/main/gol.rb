require_relative './grid.rb'

class GameOfLife
  attr_accessor :grid, :seedCells
  def initialize(grid = Grid.new, seedCells = Array.new)
    @grid = grid
    @seedCells = seedCells
    @seedCells.each do |aliveCell|
      if aliveCell[0] >= 0 && aliveCell[0] < @grid.rows && aliveCell[1] >= 0 && aliveCell[1] < @grid.cols
        @grid.cells[aliveCell[0]][aliveCell[1]].alive = true
      end
    end
  end

  def apply_rules
    @grid.cells.each do |row|
      row.each do |cell|
        neighbours_counter = @grid.neighbours_alive_counter(cell)
        if cell.isAlive? && neighbours_counter < 2
          cell.alive = false
        end
        if cell.isAlive? && neighbours_counter > 3
          cell.alive = false
        end
        if cell.isAlive? && ( neighbours_counter == 2 || neighbours_counter == 3 )
          cell.alive = true
        end
        if !cell.isAlive? && neighbours_counter == 3
          cell.alive = true
        end
      end
    end
  end
end