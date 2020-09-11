# frozen_string_literal: false

# translates a Caesar Cipher code
class CaesarTranslator
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def translate(shift, result = '')
    message.each_char do |char|
      base = char.ord < 91 ? 65 : 97
      result << character_shift(char, base, shift)
    end
    result
  end

  private

  def character_shift(char, base, shift)
    char_num = char.ord
    if char_num.between?(65, 90) || char_num.between?(97, 122)
      rotation = (((char_num - base) + shift) % 26) + base
      rotation.chr
    else
      char
    end
  end
end
