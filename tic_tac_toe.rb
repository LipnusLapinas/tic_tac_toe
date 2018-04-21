class Game
  attr_reader :player
  def initialize
	@board = Array.new(9)
	@board.each_with_index do |value, index|
	  @board[index] = index + 1
	end
	@player = 1
  end

  def game_state
	print "\n"
	@board.each_with_index do |value, index|
	  print "| #{value} "
	  if(index % 3 == 2)
	    print "|\n"
	  end
	end
  end

  def player_turn(space)
	if(@board[space.to_i - 1] == "x" || @board[space.to_i - 1] == "0")
      puts "This space is already taken"
	  return
	end
	if @player == 1
	  value = "x"
	  @player = 2
	else
	  value = "0"
	  @player = 1
	end
	@board[space.to_i - 1] = value
  end

  def game_over?
    if(@board[0] == @board[1] && @board[1]== @board[2])
	  return true
	elsif(@board[3] == @board[4] && @board[4]== @board[5])
	  return true
	elsif(@board[6] == @board[7] && @board[7] == @board[8])
	  return true
	elsif(@board[0] == @board[3] && @board[3] == @board[6])
	  return true
	elsif(@board[1] == @board[4] && @board[4] == @board[7])
	  return true
	elsif(@board[2] == @board[5] && @board[5] == @board[8])
	  return true
	elsif(@board[0] == @board[4] && @board[4] == @board[8])
	  return true
	elsif(@board[2] == @board[4] && @board[4] == @board[6])
	  return true
	else
	  return false
	end
  end
end

game = Game.new
game.game_state
valid_space = false
until(game.game_over?)
  puts "It's player #{game.player}'s turn! Where would you like to move? (1-9) "
  space = gets.chomp
  for num in 1..9
    if(space.to_i == num)
	  valid_space = true
      break
    elsif(num == 9)
	  puts "That is not a possible space!"
	  valid_space = false
    end
  end
  if(!valid_space)
    next
  end
  game.player_turn(space)
  game.game_state
end
puts "Player #{game.player} wins!"
