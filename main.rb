require './lib/game'
require './lib/rule'
require './lib/field'
require './lib/input'

puts 'Welcome to tic-tac-toe!'
game = Game.new
game.play
