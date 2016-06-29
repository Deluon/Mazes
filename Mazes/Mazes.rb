############################################################
#
#    Name:        Joel Simmons
#    Assignment:  Mazes
#    Date:        11/17/2014
#    Class:       CIS 282
#    Description: Create a program that solves mazes
#
############################################################

#get user info
print "Hello, user. What is your name? "
name = gets.chomp
name = name.downcase
name = name.capitalize!
puts "Nice to meet you, #{name}. Which maze would you like to solve?"
puts


#read maze files
def print_menu
  maze_files = Dir.glob("*.mz")
  maze_files.sort.each_with_index do |file_name, index|
    puts "#{index + 1}. #{file_name}"
  end
  puts "11. quit"
end
print_menu
# choice = gets.chomp.to_i


def print_maze(maze)
   maze.each do |row|
   puts row.join
   end
end

def solve_maze(maze)
#solving the maze
  row = 0
  while row < maze.length
    col = 0
    while col < maze[row].length
      if maze[row][col] == "F"
        if col + 1 <= maze[row].length && maze[row][col + 1] == " "
          maze[row][col + 1] = 0
        end
        if col - 1 >= 0 && maze[row][col - 1] == " "
          maze[row][col - 1] = 0
        end
        if row + 1 < maze.length && maze[row + 1][col] == " "
          maze[row + 1][col] = 0
        end
        if row - 1 >= 0 && maze[row - 1][col] == " "
          maze[row - 1][col] = 0
        end
      end
      col += 1
    end
    row += 1
  end

#printing numbers to "S"
  s_found = false
  num = 0
  solve = true

  while s_found == false && solve == true
    row = 0
    solve = false
    while row < maze.length
      col = 0
      while col < maze[row].length
        if maze[row][col] == num

          if row - 1 >= 0 && maze[row - 1][col] == " "
            maze[row - 1][col] = num + 1
            solve = true
          end
          if row + 1 < maze.length && maze[row + 1][col] == " "
            maze[row + 1][col] = num + 1
            solve = true
          end
          if col - 1 >= 0 && maze[row][col - 1] == " "
            maze[row][col - 1] = num + 1
            solve = true
          end
          if col + 1 <= maze[row].length && maze[row][col + 1] == " "
            maze[row][col + 1] = num + 1
            solve = true
          end
          if row - 1 >= 0 && maze[row - 1][col] == "S" ||
              row + 1 < maze.length && maze[row + 1][col] == "S" ||
              col - 1 >= 0 && maze[row][col - 1] == "S" ||
              col + 1 <= maze[row].length && maze[row][col + 1] == "S"
            s_found = true
          end
        end
        col += 1
      end
      row += 1
    end
    if solve == false && s_found == false
      puts "Cannot Solve"
    end
    num += 1
  end

  row = 0
  while row < maze.length
    col = 0
    while col < maze[row].length
      if maze[row][col] == "S"
        s_pos = [row, col]
      end
      col += 1
    end
    row += 1
  end
# puts maze[s_row][s_col]

  row = s_pos[0]
  col = s_pos[1]
  while num >= 0
    if maze[row][col + 1] == num
      maze[row][col + 1] = "*"
      col += 1
    elsif maze[row][col - 1] == num
      maze[row][col - 1] = "*"
      col -= 1
    elsif maze[row + 1][col] == num
      maze[row + 1][col] = "*"
      row += 1
    elsif maze[row - 1][col] == num
      maze[row - 1][col] = "*"
      row -= 1
    end
    num -= 1
  end

#eliminate numbers
  row = 0
  while row < maze.length
    col = 0
    while col < maze[row].length
      if maze[row][col].class == Fixnum
        maze[row][col] = " "
      end
      col += 1
    end
    row += 1
  end
end

choice = 0
until choice == 11
  choice = gets.chomp.to_i
  if choice == 1
    maze = []
    maze_file = File.open("maze01.mz")
    while !maze_file.eof?
      maze << maze_file.gets.chomp.split("")
    end
    solve_maze(maze)
    print_maze(maze)
    print_menu
  elsif choice == 2
    maze = []
    maze_file = File.open("maze02.mz")
    while !maze_file.eof?
      maze << maze_file.gets.chomp.split("")
    end
    solve_maze(maze)
    print_maze(maze)
    puts 'What is your next choice? '
    print_menu
  elsif choice == 3
    maze = []
    maze_file = File.open("maze03.mz")
    while !maze_file.eof?
      maze << maze_file.gets.chomp.split("")
    end
    solve_maze(maze)
    print_maze(maze)
    puts 'What is your next choice? '
    print_menu
  elsif choice == 4
    maze = []
    maze_file = File.open("maze04.mz")
    while !maze_file.eof?
      maze << maze_file.gets.chomp.split("")
    end
    solve_maze(maze)
    print_maze(maze)
    puts 'What is your next choice?'
    print_menu
  elsif choice == 5
    maze = []
    maze_file = File.open("maze05.mz")
    while !maze_file.eof?
      maze << maze_file.gets.chomp.split("")
    end
    solve_maze(maze)
    print_maze(maze)
    puts 'What is your next choice? '
    print_menu
  elsif choice == 6
    maze = []
    maze_file = File.open("maze06.mz")
    while !maze_file.eof?
      maze << maze_file.gets.chomp.split("")
    end
    solve_maze(maze)
    print_maze(maze)
    puts 'What is your next choice? '
    print_menu
  elsif choice == 7
    maze = []
    maze_file = File.open("maze07.mz")
    while !maze_file.eof?
      maze << maze_file.gets.chomp.split("")
    end
    solve_maze(maze)
    print_maze(maze)
    puts 'What is your next choice? '
    print_menu
  elsif choice == 8
    maze = []
    maze_file = File.open("maze08.mz")
    while !maze_file.eof?
      maze << maze_file.gets.chomp.split("")
    end
    solve_maze(maze)
    print_maze(maze)
    puts 'What is your next choice? '
    print_menu
  elsif choice == 9
    maze = []
    maze_file = File.open("maze09.mz")
    while !maze_file.eof?
      maze << maze_file.gets.chomp.split("")
    end
    solve_maze(maze)
    print_maze(maze)
    puts 'What is your next choice? '
    print_menu
  elsif choice == 10
    maze = []
    maze_file = File.open("maze10.mz")
    while !maze_file.eof?
      maze << maze_file.gets.chomp.split("")
    end
    solve_maze(maze)
    print_maze(maze)
    puts 'What is your next choice? '
    print_menu
  elsif choice == 11
    puts "Thank you for your time!"
    end
  if choice < 1 || choice > 11
    puts "Can you even read the menu?"
  end
end