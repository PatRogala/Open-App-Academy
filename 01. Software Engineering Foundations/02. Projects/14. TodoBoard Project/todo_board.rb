require_relative 'list'

class TodoBoard
  def initialize
    @board = {}
  end

  def get_command
    print "\nEnter a command: "
    cmd, *args = gets.chomp.split(' ')

    case cmd
    when 'mklist'
      @board[args[0]] = List.new(args[0])
    when 'ls'
      puts @board.keys.join("\n")
    when 'showall'
      @board.values.each { |list| list.print }
    when 'mktodo'
      @board[args[0]].add_item(*args[1..-1])
    when 'up'
      @board[args[0]].up(*args[1..-1].map(&:to_i))
    when 'down'
      @board[args[0]].down(*args[1..-1].map(&:to_i))
    when 'swap'
      @board[args[0]].swap(*args[1..-1].map(&:to_i))
    when 'sort'
      @board[args[0]].sort_by_date!
    when 'priority'
      @board[args[0]].print_priority
    when 'print'
      args.length > 1 ? @board[args[0]].print_full_item(*args[1..-1].map(&:to_i)) : @board[args[0]].print
    when 'toggle'
      @board[args[0]].toggle_item(*args[1..-1].map(&:to_i))
    when 'rm'
      @board[args[0]].remove_item(*args[1..-1].map(&:to_i))
    when 'purge'
      @board[args[0]].purge
    when 'quit'
      return false
    else
      print 'Sorry, that command is not recognized.'
    end

    true
  end

  def run
    while get_command
    end
  end
end
