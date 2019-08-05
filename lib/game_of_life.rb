require "./game_of_life/version"

module GameOfLife
  class Error < StandardError; end
  # calculate width,larga and total of squares to the board
  class Tableros
    attr_accessor :num_squares, :mini_colums, :width_board,:total_squares, 
    :original_board, :copycat_board
    def initialize(num_squares)
      @num_squares = num_squares
    end

    def large_boards
      @mini_colums = 3 * @num_squares
    end

    def width_board
      @width_board = 9 * @num_squares
    end

    def total_squares
      @total_squares = 9 * (@num_squares ** 2)
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

  end
  tableros = Tableros.new(2)
  tableros.large_boards
  tableros.width_board
  tableros.total_squares
  tableros.create_origina_board
  tableros.copycat_board
  tableros.list_boards
  tableros.show_copycat_board
  tableros.last_line
  input_user = 0

  loop do
    puts "Please, choose a position "
    input_user = gets.chomp
    answer = tableros.validate_input_user(input_user)
    input_user = input_user.to_i
    break if answer
  end

  case input_user
  when 1..tableros.mini_colums
    puts 'great'
  when tableros.last_line
    puts tableros.last_line
  end
end
