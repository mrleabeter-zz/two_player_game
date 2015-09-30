class TwoPlayerGame

  attr_reader :player_one, :player_one_lives, :player_one_score, :player_two, :player_two_lives, :player_one_score, :number_1, :number_2

  @@player_lives = 3
  @@player_score = 0
  # @current_player = @player_one

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_one_lives = @@player_lives
    @player_one_score = @@player_score
    @player_two = player_two
    @player_two_lives = @@player_lives
    @player_two_score = @@player_score
    @current_player = @player_one
  end

  def generate_question
    @number_1 = rand(1..20)
    @number_2 = rand(1..20)
    @correct_answer = number_1 + number_2
  end

  def ask_question
    until @player_one_lives == 0 || @player_two_lives == 0
      generate_question
      current_player_stats
      puts ("What is #{@number_1} + #{@number_2}?").colorize(:blue)
      answer = gets.chomp.to_i
      if answer == @correct_answer
        if @current_player == @player_one
          @player_one_score += 1
        else
          @player_two_score += 1
        end
        puts ("Great work! 1 point added!").colorize(:green)
      else
        if @current_player == @player_one
          @player_one_lives -= 1
        else
          @player_two_lives -= 1
        end
        puts ("Sorry, that's incorrect.").colorize(:red)
      end
      player_switch
    end
    puts ("***GAME OVER***\nSorry #{@current_player}, you have no lives left.").colorize(:red)
    puts ("Good work!\n#{@player_one} you scored #{@player_one_score} points!\n#{@player_two} you scored #{@player_two_score} points.").colorize(:yellow)
  end

  def player_switch
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def current_player_stats
    if @current_player == @player_one
      puts "Okay #{@player_one}, you currently have #{@player_one_lives} lives left and have #{@player_one_score} points."
    else
      puts "Okay #{@player_two}, you currently have #{@player_two_lives} lives left and have #{@player_two_score} points."
    end
  end

end