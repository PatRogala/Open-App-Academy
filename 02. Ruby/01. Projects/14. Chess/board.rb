# frozen_string_literal: true

require_relative 'pieces/piece'
require_relative 'pieces/null_piece'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'

# Class that represents a board of chess
class Board
  attr_reader :rows

  def initialize(fill_board = true)
    @null_piece = NullPiece.instance
    make_starting_grid(fill_board)
  end

  def [](pos)
    raise 'Invalid position' unless valid_pos?(pos)

    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    raise 'invalid pos' unless valid_pos?(pos)

    row, col = pos
    @rows[row][col] = val
  end

  def checkmate?(color)
    return false unless in_check?(color)

    pieces.select { |p| p.color == color }.all? do |piece|
      piece.valid_moves.empty?
    end
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def dup
    new_board = Board.new(false)

    pieces.each do |piece|
      piece.class.new(piece.color, new_board, piece.pos)
    end

    new_board
  end

  def empty?(pos)
    self[pos].empty?
  end

  def move_piece(color, start_pos, end_pos)
    raise 'There is no piece at that position' if self[start_pos].empty?
    raise 'You cannot move there' unless valid_pos?(end_pos)

    piece = self[start_pos]
    handle_move_piece(piece, start_pos, end_pos, color)
    move_piece!(start_pos, end_pos)
  end

  def in_check?(color)
    king_pos = find_king(color).pos
    pieces.any? do |p|
      p.color != color && p.moves.include?(king_pos)
    end
  end

  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = @null_piece
    piece.pos = end_pos
  end

  def handle_move_piece(piece, start_pos, end_pos, color)
    raise 'You must move your own piece' unless self[start_pos].color == color
    raise 'Piece does not move like that' unless piece.moves.include?(end_pos)
    raise 'You cannot move there' unless piece.valid_moves.include?(end_pos)
  end

  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

  def pieces
    @rows.flatten.reject(&:empty?)
  end

  private

  def find_king(color)
    pieces.find { |p| p.color == color && p.is_a?(King) }
  end

  def make_starting_grid(fill_board)
    @rows = Array.new(8) { Array.new(8, @null_piece) }
    return unless fill_board

    %i[white black].each do |color|
      fill_back_row(color)
      fill_pawns_row(color)
    end
  end

  def fill_back_row(color)
    back_pieces = [
      Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
    ]

    i = color == :white ? 7 : 0
    back_pieces.each_with_index do |piece_class, j|
      piece_class.new(color, self, [i, j])
    end
  end

  def fill_pawns_row(color)
    i = color == :white ? 6 : 1
    8.times { |j| Pawn.new(color, self, [i, j]) }
  end
end
