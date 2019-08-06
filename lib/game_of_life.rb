require "./game_of_life/version"

module GameOfLife
  class Error < StandardError; end
  # calculate width,larga and total of squares to the board
  class Tableros
    attr_accessor :num_squares, :mini_colums, :width_square, :total_squares,
    :original_board, :copycat_board
    def initialize(num_squares)
      @num_squares = num_squares
    end

    def large_boards
      @mini_colums = 3 * @num_squares
    end

    def width_square
      @width_square = 9 * @num_squares
    end

    def total_squares
      @total_squares = 9 * @num_squares ** 2
    end

    def create_origina_board
      @original_board = Array.new(@mini_colums) {Array.new(@mini_colums)}
    end

    def copycat_board
      @copycat_board =  @original_board
    end

    def show_original_board
      @original_board.each { |elem| puts elem.join(' | ') }
    end

    def show_copycat_board
      @copycat_board.each { |elem| puts elem.join(' | ') }
    end

    def list_boards
      num = 0
      @copycat_board.map! do |elem_exter|
        elem_exter.map! do
          num += 1
        end
      end
    end

    def validate_input_user(input_user)
      /[^\D]/.match(input_user)
    end

    def last_line
      @last_line = @total_squares - @mini_colums
    end

    def position_row(input_user)
      @row = input_user / @mini_colums
    end

    def position_columns(input_user)
      @columna = input_user - (@row * @mini_colums)
    end

  end
# start the game of life
  class Play
    def initialize(copy_board)
      @copy_board = copy_board
    end

    def top_row
      columna = 0
      top_row = []
      loop do
        top_row.push(@copycat_board[columna])
        columna += 3
        break if columna == @mini_colums
      end
=begin
      initial_position = 0
      final_position = 2
      top_row = 0
      medium_row = 1
      low_row = 2
      loop do
        (initial_position..final_position).each do |position|
          puts position
        end
        initial_position += 3
        final_position += 3
        top_row += 1
        medium_row += 1
        low_row += 1
        break if final_position > @total_squares - 1
      end
=end
    end

    def medium_row
      columna = 1
      medium_row = []
      loop do
        medium_row.push(@copycat_board[columna])
        columna += 3
        break if columna > @mini_colums
      end
    end
    def low_row
      columna = 2
      low_row = []
      loop do
        low_row.push(@copycat_board[columna])
        columna += 3
        break if columna > @mini_colums
      end
    end

  end
  tableros = Tableros.new(2)
  play = Play.new
  tableros.large_boards
  tableros.width_square
  tableros.total_squares
  tableros.create_origina_board
  tableros.copycat_board
  tableros.list_boards
  # tableros.show_copycat_board
  tableros.last_line
  play.top_row
  play.medium_row
  play.low_row
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
