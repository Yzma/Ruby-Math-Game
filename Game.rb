
require './Player'
require './PlayerManager'
require './Question'

class Game

  attr_accessor :player_manager

  def initialize()
    @player_manager = PlayerManager.new()
  end

  def start
    while true

      puts "----- NEW QUESTION -----"

      question = Question.new()

      puts "#{@player_manager.current_player.name}: What does #{question.first_random_number} plus #{question.second_random_number} equal?"

      print "> "
      answer_input = gets.chomp.to_i

      if(question.is_correct?(answer_input))
        puts "YES! You are correct!"
      else
        puts "Seriously? No!"
        @player_manager.current_player.lives -= 1
      end

      break if check_game_over

      print_screen

      @player_manager.end_turn
    end
  end

  def print_screen
    @player_manager.players.each_with_index { |e, i| 
      print "#{e.name}: #{e.lives}/#{Player::DEFAULT_LIVES}"
      print " vs " if i != @player_manager.players.length - 1
    }
    puts "\n \n" 
  end

  def check_game_over
    winner = @player_manager.players.select { |e| e.lives > 0 }
    if(winner.length == 1)
      puts "#{winner[0].name} has won with a score of #{winner[0].lives}/#{Player::DEFAULT_LIVES}"
      return true
    end
    
    return false
  end

end
