module OnePlayerGame

  def one_player_game(name)
    player = Player.new(name)
    until player.player_lives == 0
      question = Question.new
      puts "Okay #{player.name}, you currently have #{player.player_lives} lives left and have #{player.player_score} points."
      puts ("What is #{question.number_1} + #{question.number_2}?").colorize(:blue)
      answer = gets.chomp.to_i
      if answer == question.correct_answer
        player.add_point
        puts ("Great work! 1 point added!").colorize(:green)
      else
        player.subtract_life
        puts ("Sorry, that's incorrect.").colorize(:red)
      end
    end
    puts ("***GAME OVER***").colorize(:red)
    puts ("Good work #{player.name} you scored a total of #{player.player_score} points!").colorize(:yellow)
  end

end