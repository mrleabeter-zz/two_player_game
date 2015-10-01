module TwoPlayerGame

  attr_accessor :player_one, :player_one_lives, :player_one_score, :player_two, :player_two_lives, :player_one_score, :number_1, :number_2


  def two_player_game(player_one, player_two)
    $first_player = Player.new(player_one)
    $second_player = Player.new(player_two)
    $current_player = $first_player
    until $first_player.player_lives == 0 || $second_player.player_lives == 0
      question = Question.new
      current_player_stats
      puts ("What is #{question.number_1} + #{question.number_2}?").colorize(:blue)
      answer = gets.chomp.to_i
      if answer == question.correct_answer
        if $current_player == $first_player
          $first_player.add_point
        else
          $second_player.add_point
        end
        puts ("Great work! 1 point added!").colorize(:green)
      else
        if $current_player == $first_player
          $first_player.subtract_life
        else
          $second_player.subtract_life
        end
        puts ("Sorry, that's incorrect.").colorize(:red)
      end
      player_switch
    end
    player_switch
    puts ("***GAME OVER***\nSorry #{$current_player.name}, you have no lives left.").colorize(:red)
    puts ("Good work!\n#{$first_player.name} you scored #{$first_player.player_score} points!\n#{$second_player.name} you scored #{$second_player.player_score} points.").colorize(:yellow)
  end

  def player_switch
    if $current_player == $first_player
      $current_player = $second_player
    else
      $current_player = $first_player
    end
  end

  def current_player_stats
    if $current_player == $first_player
      puts "Okay #{$first_player.name}, you currently have #{$first_player.player_lives} lives left and have #{$first_player.player_score} points."
    else
      puts "Okay #{$second_player.name}, you currently have #{$second_player.player_lives} lives left and have #{$second_player.player_score} points."
    end
  end

end