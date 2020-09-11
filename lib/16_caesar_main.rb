# frozen_string_literal: true

require_relative '../lib/16a_caesar_breaker'
require_relative '../lib/16b_caesar_translator'
require_relative '../lib/16c_database'

# This file can be run in the console.

phrase = CaesarBreaker.new('Rovvy, Gybvn!')
phrase.decrypt
