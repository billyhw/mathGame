# Player: relevant Info:
# lives, sees questions, answer it
# need a function to see question, answer question, and lose lifes
# inititalize playerID, lives (default = 3)

class MathGame::Player

  attr_reader :id
  attr_accessor :lives # lives has to be decremented

  # iniitialize, 3 lives
  def initialize
    @lives = 3
  end

  # for output to console
  def display_lives
    "#{@lives}/3"
  end

end