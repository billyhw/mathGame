class MathGame::Game

# Game: relevant Info:
# Need to keep track of the turn, determine player answered correctly
# or not. Delete life of player by one if answered incorrectly,
# end game when a player lose all lifes
# initialize: Two players, turn (default player 1)

  attr_reader :player1, :player2, :turn

  def initialize
    @player1 = MathGame::Player.new
    @player2 = MathGame::Player.new
    @turn = "Player 1" # default player 1 goes first
    @players = { "Player 1" => @player1, "Player 2" => @player2 }
  end

  def change_turn
    if @turn == "Player 1"
      @turn = "Player 2"
    else
      @turn = "Player 1"
    end
  end

  # call a sequence of methods from question class
  # to ask question, obtain answer, display the results
  # and return whether the player got it right
  def ask_question_and_check_answer
    question = MathGame::Question.new
    puts "#{@turn}: #{question.display_question}"
    question.obtain_answer
    question.display_message_on_answer
    question.correct?
  end

  # note this function take in a player as argument
  def ask_question_and_update_lives(player)
    result = ask_question_and_check_answer
    if !result
      player.lives -= 1
    end
  end

  # start game, and game stops when one of the players lose all lifes
  def start
    while @player1.lives > 0 && @player2.lives > 0
      ask_question_and_update_lives(@players[@turn])
      puts "P1: #{@player1.display_lives} vs P2: #{@player2.display_lives}"
      puts "----- NEW TURN -----"
      change_turn
    end
    # the change_turn above automatically set the next player as winner
    puts "#{@turn} wins with a score of #{@players[@turn].display_lives}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

end