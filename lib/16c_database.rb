# frozen_string_literal: false

require 'yaml'

# Contains methods to save or load a game
module Database
  def save_decrypted_messages
    Dir.mkdir '16_cipher' unless Dir.exist? '16_cipher'
    filename = "#{create_filename}.yaml"
    File.open("16_cipher/#{filename}", 'w') { |file| file.write save_to_yaml }
    display_file_location(filename)
  rescue SystemCallError => e
    puts "Error while writing to file #{filename}."
    puts e
  end

  def save_to_yaml
    YAML.dump(
      'message' => @message,
      'decrypted_messages' => @decrypted_messages
    )
  end

  private

  def create_filename
    @message.scan(/\w+/).join
  end

  def display_file_location(file_name)
    puts "'#{@message}' has been decoded."
    puts "The 25 possibilities are saved in a file in 16_cipher/#{file_name}"
  end
end
