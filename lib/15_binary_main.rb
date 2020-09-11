# frozen_string_literal: true

require_relative '../lib/15a_binary_game'
require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

# This file can be run in the console.

minimum = 1
maximum = 100
game = BinaryGame.new(minimum, maximum)
game.play_game
