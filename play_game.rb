require 'colorize'
require_relative 'players'
require_relative 'one_player_game'
require_relative 'two_player_game'

puts "Hello, would you like to play a game?\nPlease reply yes or no."
response = gets.chomp.downcase
case response
when 'yes'
  puts "Okay great! How many players would you like to play with?\nPlease enter 1 or 2."
  number_of_players = gets.chomp.to_i
  if number_of_players == 1
    puts "Please enter your name."
    name = gets.chomp.capitalize
    new_game = OnePlayerGame.new(name)
    new_game.ask_question

  elsif number_of_players == 2
    puts "Please enter a name for player 1."
    player_one_name = gets.chomp.capitalize
    puts "Please enter a name for player 2."
    player_two_name = gets.chomp.capitalize
    new_game = TwoPlayerGame.new(player_one_name, player_two_name)
    new_game.ask_question

  elsif number_of_players > 2
    puts ("I'm sorry, this game only supports up to 2 players at this time.").colorize(:red)
  else
    puts ("I'm sorry, I don't recognize that command.  Let's try again later.").colorize(:red)
  end
when 'no'
  puts ("Oh well. Maybe we can play another day.").colorize(:yellow)
else
  puts ("I'm sorry, I don't recognize that command.  Let's try again later.").colorize(:red)
end