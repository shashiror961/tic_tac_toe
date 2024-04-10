class Game < ApplicationRecord
  validates :player1_name, :player2_name, presence: true
  has_many :moves
  serialize :board, JSON

  def current_player
    moves_count.even? ? player1_name : player2_name
  end

  def make_move(row, col)
    board[row][col] = current_player_symbol
    self.save
  end

  def current_player_symbol
    moves_count.even? ? 'X' : 'O'
  end

  def moves_count
    moves.count
  end

  def game_over?
    if moves.size == 9 && winner.nil?
      update(winner: 'Draw')
    end
  end

  def winner?
    winning_combinations = [
      [board[0][0], board[0][1], board[0][2]], # Rows
      [board[1][0], board[1][1], board[1][2]],
      [board[2][0], board[2][1], board[2][2]],
      [board[0][0], board[1][0], board[2][0]], # Columns
      [board[0][1], board[1][1], board[2][1]],
      [board[0][2], board[1][2], board[2][2]],
      [board[0][0], board[1][1], board[2][2]], # Diagonals
      [board[0][2], board[1][1], board[2][0]]
    ]

    winning_combinations.any? do |combo|
      if combo.all?('X')
        update(winner: player1_name)
        return true
      elsif combo.all?('O')
        update(winner: player2_name)
        return true
      end
    end
  end

end
