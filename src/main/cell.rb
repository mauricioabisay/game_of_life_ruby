class Cell
  attr_accessor :row, :col, :alive
  def initialize(row = 0, col = 0, alive = false)
    @row = row
    @col = col
    @alive = alive
  end

  def isAlive?
    @alive
  end

  def to_s
    @alive ? '1' : '0'
  end

end