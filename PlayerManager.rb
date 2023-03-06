
class PlayerManager

  attr_reader :players

  def initialize()
    @players = [Player.new("Player 1"), Player.new("Player 2")]
    @player_turn_index = 0
  end

  def current_player
    return @players[@player_turn_index]
  end

  def end_turn
    @player_turn_index += 1
    if(@player_turn_index == @players.length)
      @player_turn_index = 0
    end
  end

end
