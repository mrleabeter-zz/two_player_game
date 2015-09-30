require 'colorize'

@player1_lives = 3
@player2_lives = 3
@current_player = 1

def being_round
  @num_1 = rand(1..100)
  @num_2 = rand(1..100)
  generate_question
end

def generate_question
  player_lives
  @correct_answer = @num_1 + @num_2
  puts ("What is #{@num_1} + #{@num_2}?").colorize(:yellow)
  user_input = (gets.chomp).to_i
  if user_input == @correct_answer
    puts ("Correct!").colorize(:green)
    
    else    
    puts ("Stupid! You're so stupid!").colorize(:red)
    if @current_player == 1
      @player1_lives -= 1
    else 
      @player2_lives -= 1
    end   
  end  
  player_switch
end

def player_switch
  if @current_player == 1
    @current_player = 2
  end
end 

def player_lives
  if @current_player == 2
    puts ("It's Player #{@current_player}'s turn.\nYou have #{@player1_lives} lives remaining.").colorize(:light_blue)
  else
    puts ("It's Player #{@current_player}'s turn.\nYou have #{@player1_lives} lives remaining.").colorize(:light_blue)
  end
end

loop do
  being_round
  break unless ((@player1_lives > 0) && (@player2_lives > 0))  
end

puts "Game over!"