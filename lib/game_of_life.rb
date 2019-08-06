require "./game_of_life/version"

module GameOfLife
  class Error < StandardError; end
  # calculate width,larga and total of squares to the board
  class Tableros
    attr_accessor :num_squares, :mini_colums, :width_square, :total_squares,
                  :original_board, :copycat_board, :top_row, :medium_row, :low_row
    def initialize(num_squares)
      @num_squares = num_squares
    end

    def method_large_boards
      @mini_colums = 3 * @num_squares
    end

    def method_width_square
      @width_square = 9 * @num_squares
    end

    def method_total_squares
      @total_squares = 9 * @num_squares ** 2
    end

    def method_create_origina_board
      @original_board = Array.new(@mini_colums) {Array.new(@mini_colums)}
    end

    def method_copycat_board
      @copycat_board =  @original_board
    end

    def method_show_original_board
      @original_board.each { |elem| puts elem.join(' | ') }
    end

    def method_show_copycat_board
      @copycat_board.each { |elem| puts elem.join(' | ') }
    end

    def method_list_boards
      num = 0
      @copycat_board.map! do |elem_exter|
        elem_exter.map! do
          num += 1
        end
      end
    end

    def method_validate_input_user(input_user)
      /[^\D]/.match(input_user)
    end

    def method_last_line
      @last_line = @total_squares - @mini_colums
    end

    def method_position_row(input_user)
      @row = input_user / @mini_colums
    end

    def method_position_columns(input_user)
      @columna = input_user - (@row * @mini_colums)
    end

  end
  # start the game of life
  class Play
    def initialize(copy_board)
      @copy_board = copy_board
    end

    def method_top_row
      columna = 0
      @top_row = []
      loop do
        @top_row.push(@copycat_board[columna])
        columna += 3
        break if columna == @mini_colums
      end
    end

    def method_medium_row
      columna = 1
      @medium_row = []
      loop do
        @medium_row.push(@copycat_board[columna])
        columna += 3
        break if columna > @mini_colums
      end
    end

    def method_low_row
      columna = 2
      @low_row = []
      loop do
        @low_row.push(@copycat_board[columna])
        columna += 3
        break if columna > @mini_colums
      end
    end

    def comprobar
      position = 0
      until dividers < num_squares - 1
        mini_check = []
        mini_check.push(@top_row[position])
        mini_check.push(@medium_row[position])
        mini_check.push(@low_row[position])
      end
    end
  end
  tableros = Tableros.new(2)
  play = Play.new
  tableros.method_large_boards
  tableros.method_width_square
  tableros.method_total_squares
  tableros.method_create_origina_board
  tableros.method_copycat_board
  tableros.method_list_boards
  # tableros.show_copycat_board
  tableros.method_last_line
  play.method_top_row
  play.method_medium_row
  play.method_low_row
  input_user = 0
  loop do
    puts 'Please, choose a position '
    input_user = gets.chomp
    answer = tableros.validate_input_user(input_user)
    break if answer
  end
  input_user = input_user.to_i
  input_user -= 1
  case input_user
  when 0..tableros.mini_colums
    puts 'great'
  when tableros.last_line..tableros.total_squares
    puts 'f'
  end
end
