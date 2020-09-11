# frozen_string_literal: false

require_relative '../lib/16c_database'

# breaks the Caesar Cipher code
class CaesarBreaker
  include Database

  def initialize(message, translator = CaesarTranslator.new(message))
    @message = message
    @translator = translator
    @decrypted_messages = []
  end

  def decrypt
    create_decrypted_messages
    save_decrypted_messages
  end

  def create_decrypted_messages
    26.times do |shift|
      @decrypted_messages << @translator.translate(shift)
    end
  end
end
