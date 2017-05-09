# Question: relevant Info:
# Create a question and check the supplied answer.
# need a function to generate two random integers.
class MathGame::Question

# Question: relevant Info:
# create questin, check answer
# need function to generate two random integers

  attr_reader :int_A, :int_B

  def initialize
    @int_A = (1..20).to_a.sample # generate an integer between 1 and 20
    @int_B = (1..20).to_a.sample
    # there appears to be multiple possible response to wrong answer
    # will randomly display one
    @wrong_response = ["Seriously? No!", "ZOMG No NO NO!"]
  end

  def display_question
    "What does #{@int_A} plus #{@int_B} equal?"
  end

  def obtain_answer
    @answer = gets.chomp.to_i
  end

  def correct?
    @answer == @int_A + @int_B
  end

  def display_message_on_answer
    if correct?
      puts "You've got it right"
    else
      puts "#{@wrong_response.sample}"
    end
  end

end
