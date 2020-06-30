require_relative './cell.rb'
require_relative './grid.rb'
require_relative './gol.rb'

grid_rows = 3
grid_cols = 3
alive_cells = [[0,0], [0,1], [1,0]]

ARGV.each do |arg|
  if arg.match(/^\[[0-9]+,[0-9]+\]$/)
    alive_cell = arg.scan(/[0-9]+/)
    alive_cells << [alive_cell[0].to_i, alive_cell[1].to_i]
  elsif arg.match(/^(-r)\d+$/)
    grid_rows = arg.scan(/\d+/)[0].to_i
  elsif arg.match(/^(-c)\d+$/)
    grid_cols = arg.scan(/\d+/)[0].to_i
  end
end

grid = Grid.new(grid_rows, grid_cols)
game = GameOfLife.new(grid, alive_cells)
generation_counter = 0
continue = 'Y'
while(continue.casecmp("Y") >= 0) do
  puts "Generation: #{generation_counter}"
  game.grid.cells.each do |row|
    row.each do |cell|
      game.apply_rules
      print cell.to_s
    end
    print "\n"
  end
  generation_counter += 1
  puts "Press Y and ENTER to continue."
  continue = $stdin.gets.strip
end