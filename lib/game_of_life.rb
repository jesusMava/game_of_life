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
      @copycat_board.each { |elem| puts elem.join(' ') }
    end

    def method_list_boards
      @copycat_board.map! do |elem_exter|
        elem_exter.map! do
          '.'
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
    attr_accessor :array_currently_alive, :live, :dead
    def initialize(copy_board)
      @copy_board = copy_board
      @live = []
      @dead = []
      @array_currently_alive = []
    end

    def method_select_cells_alive(fila = 0)
      until fila >= @copy_board.mini_colums
        @copy_board.copycat_board[fila].each_with_index do |x, index|
          if x == 'V'
            @array_currently_alive.push([fila, index])
          end
        end
        fila += 1
      end
    end

    def method_decision
      @array_currently_alive.each do |elem|
        if elem[0]
          
        end
        case elem
        when elem[0].zero?
          puts "ss"
          method_up_row(elem)
        when elem[1] == 0
          puts "jb"
        when elem[1] == 0
          #method_down_row(elem)
        else
          puts "a"
          #method_normal_row(elem)
        end
      end
    end

    def method_up_row(elem, pos1 = 0, pos2 = 0, pos3 = 3)
      mini_cat = []
      y = elem[1]
      (-1..1).each do |row|
        pos1 = @copy_board.copycat_board[row][y - 1]
        pos2 = @copy_board.copycat_board[row][y]
        y + 1 > @copy_board.mini_colums - 1 ? y = 0 : y + 1
        pos3 = @copy_board.copycat_board[row][y]
        mini_cat.push([pos_1, pos_2, pos_3])
      end
      eval_mini_cat(mini_cat)
    end

    def eval_mini_cat(mini_cat)
      mini_cat.each do |cell|
      end
    end

    def method_down_row(elem)
    end
    
    def method_normal_row(elem)
    end
  end

  tableros = Tableros.new(8)
  play = Play.new(tableros)
  tableros.method_large_boards
  tableros.method_width_square
  tableros.method_total_squares
  tableros.method_create_origina_board
  tableros.method_copycat_board
  tableros.method_list_boards
  play.method_select_cells_alive
  play.method_decision
  tableros.method_show_copycat_board
  tableros.method_last_line
end
