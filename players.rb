class Player

  attr_reader :name, :player_lives, :player_score

  @@player_lives = 3
  @@starting_score = 0

  def initialize(name)
    @name = name
    @player_lives = @@player_lives
    @player_score = @@starting_score
  end

end