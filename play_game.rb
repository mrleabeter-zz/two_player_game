require 'colorize'
require_relative 'players'
require_relative 'question_generator'
require_relative 'one_player_game'
require_relative 'two_player_game'
require_relative 'exceptions'

include OnePlayerGame
include TwoPlayerGame

puts "Hello, would you like to play a game?\nPlease reply yes or no."
response = gets.chomp.downcase
case response
when 'yes'
  puts "Okay great! How many players would you like to play with?\nPlease enter 1 or 2."
  number_of_players = gets.chomp.to_i
  if number_of_players == 1
    begin
      puts "Please enter your name."
      name = gets.chomp.capitalize
    raise InvalidNameError, "Invalid Name: Name must be at least one character long." unless name.length > 0
    rescue InvalidNameError => e
      puts e.message
      retry
    end
    OnePlayerGame.one_player_game(name)

  elsif number_of_players == 2
    begin
      puts "Please enter a name for player 1."
      player_one_name = gets.chomp.capitalize
    raise InvalidNameError, "Invalid Name: Name must be at least one character long." unless player_one_name.length > 0
    rescue InvalidNameError => e
      puts e.message
      retry
    end
    begin
      puts "Please enter a name for player 2."
      player_two_name = gets.chomp.capitalize
    raise InvalidName, "InvalidName: Name must be at least one character long." unless player_two_name.length > 0
    rescue InvalidName => e
      puts e.message
      retry
    end
    TwoPlayerGame.two_player_game(player_one_name, player_two_name)

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