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
end