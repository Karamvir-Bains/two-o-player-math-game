class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def take_turn
    puts "----- NEW TURN -----"

    num1 = rand(1..20)
    num2 = rand(1..20)
    question = "What does #{num1} plus #{num2} equal?"

    puts "#{@current_player.name}: #{question}"

    answer = gets.chomp.to_i

    if answer == (num1 + num2)
      puts "#{@current_player.name}: YES! You are correct."
    else
      puts "#{@current_player.name}: Seriously? No!"
      @current_player.lives -= 1
    end

    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"

    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def game_over?
    @player1.lives == 0 || @player2.lives == 0
  end

  def start
    until game_over?
      take_turn
    end
    if @player1.lives == 0
      puts "Player 2 wins with a score of #{@player2.lives}/3"
    else
      puts "Player 1 wins with a score of #{@player1.lives}/3"
    end
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end