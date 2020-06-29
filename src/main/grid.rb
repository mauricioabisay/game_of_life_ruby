class Grid
  attr_accessor :rows, :cols, :cells
  def initialize(rows = 3, cols = 3)
    @rows = rows
    @cols = cols
    @cells = Array.new(@rows) do |row|
               Array.new(@cols) do |col|
                 Cell.new(row, col)
               end
             end
  end

  def neighbours_alive_counter(cell = @cells[0][0])
    counter = 0
    counter += neighbour_up_left(cell) ? 1 : 0
    counter += neighbour_up(cell) ? 1 : 0
    counter += neighbour_up_right(cell) ? 1: 0
    counter += neighbour_right(cell) ? 1 : 0
    counter += neighbour_down_right(cell) ? 1 : 0
    counter += neighbour_down(cell) ? 1 : 0
    counter += neighbour_down_left(cell) ? 1 : 0
    counter += neighbour_left(cell) ? 1 : 0
  end

  def neighbour_up_left(cell)
    row = cell.row - 1
    col = cell.col - 1
    row >= 0 && col >= 0 && @cells[row][col].isAlive?
  end

  def neighbour_up(cell)
    row = cell.row - 1
    col = cell.col 
    row >= 0 && @cells[row][col].isAlive?
  end

  def neighbour_up_right(cell)
    row = cell.row - 1
    col = cell.col + 1
    row >= 0 && col < @cols && @cells[row][col].isAlive?
  end

  def neighbour_right(cell)
    row = cell.row
    col = cell.col + 1
    col < @cols && @cells[row][col].isAlive?
  end

  def neighbour_down_right(cell)
    row = cell.row + 1
    col = cell.col + 1
    row < @rows && col < @cols && @cells[row][col].isAlive?
  end

  def neighbour_down(cell)
    row = cell.row + 1
    col = cell.col
    row < @rows && @cells[row][col].isAlive?
  end

  def neighbour_down_left(cell)
    row = cell.row + 1
    col = cell.col - 1
    row < @rows && col >= 0 && @cells[row][col].isAlive?
  end

  def neighbour_left(cell)
    row = cell.row
    col = cell.col - 1
    col >= 0 && @cells[row][col].isAlive?
  end

end