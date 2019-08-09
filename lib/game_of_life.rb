require "game_of_life/version"

module GameOfLife
  class Error < StandardError; end
  # calculate width,larga and total of squares to the board
  class Tableros
    attr_accessor :original_board
    def method_create_origina_board
      @original_board = Array.new(30) {Array.new(30)}
    end

    def method_show_original_board
      @original_board.each { |elem| puts elem.join(' ') }
    end

    def method_list_boards
      @original_board.map! do |elem_exter|
        elem_exter.map! do
          '.'
        end
      end
    end

    def fill_board
      (1..300).each do |x|
        @original_board[rand(0..29)][rand(0..29)] = '۞'
      end
    end
  end
  # start the game of life
  class Play
    attr_accessor :array_currently_alive, :live, :dead
    def initialize(copy_board)
      @copy_board = copy_board
    end

    def play
      loop do
        afther = @copy_board.original_board.map.with_index do |ele, row|
          ele.map.with_index do |sim, col|
              eval(row, col, sim)
          end
        end
        sleep 0.5
        #afther.each { |elem| puts elem.join(' ') }
        @copy_board.original_board = afther
        system('clear')
        @copy_board.method_show_original_board
      end
    end

    def eval(row,col,sim)
      row = row.to_i
      col = col.to_i
      count = 0
      if row.positive? 
        count += 1 if col.positive? && @copy_board.original_board[row - 1][col - 1].include?('۞')
        count += 1 if @copy_board.original_board[row - 1][col].include?('۞')
        count += 1 if col < 29 && @copy_board.original_board[row - 1][col + 1].include?('۞')
      end

      if row < 29
        count += 1 if col < 29 && @copy_board.original_board[row + 1][col + 1].include?('۞')
        count += 1 if @copy_board.original_board[row + 1][col].include?('۞')
        count += 1 if col.positive? && @copy_board.original_board[row + 1][col - 1].include?('۞')
      end
      
      if col.positive?
        count += 1 if col.positive? && @copy_board.original_board[row][col - 1].include?('۞')
      end

      if col < 29
        count += 1 if col < 29 && @copy_board.original_board[row][col + 1].include?('۞')        
      end

      rulers(count, sim)
    end

    def rulers(count, sim)
      if sim == '۞'
        count == 3 ||count == 2 ? sim = '۞' : sim = '.'
      elsif count == 3
        sim = '۞'
      else
        sim = '.'
      end
    end
  end

  tableros = Tableros.new
  play = Play.new(tableros)
  tableros.method_create_origina_board
  tableros.method_list_boards
  tableros.fill_board
  tableros.method_show_original_board
  play.play
end
