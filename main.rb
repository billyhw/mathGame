module MathGame
end

require 'pry'
require './game'
require './question'
require './player'

binding.pry

MathGame::Game.new.start
