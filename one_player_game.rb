module OnePlayerGame

  attr_reader :number_1, :number_2

  def generate_question
    @number_1 = rand(1..20)
    @number_2 = rand(1..20)
    @correct_answer = number_1 + number_2
  end

  def ask_question
    until @player_lives == 0
      generate_question
      puts "Okay #{@name}, you currently have #{@player_lives} lives left and have #{@player_score} points."
      puts ("What is #{@number_1} + #{@number_2}?").colorize(:blue)
      answer = gets.chomp.to_i
      if answer == @correct_answer
        @player_score += 1
        puts ("Great work! 1 point added!").colorize(:green)
      else
        @player_lives -= 1
        puts ("Sorry, that's incorrect.").colorize(:red)
      end
    end
    puts ("***GAME OVER***\nGood work #{@name} you scored a total of #{@player_score} points!").colorize(:yellow)
  end

end