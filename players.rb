class Player

  attr_accessor :name, :player_lives, :player_score

  @@player_lives = 3
  @@starting_score = 0

  def initialize(name)
    @name = name
    @player_lives = @@player_lives
    @player_score = @@starting_score
  end

  def add_point
    @player_score += 1
  end

  def subtract_life
    @player_lives -= 1
  end

end