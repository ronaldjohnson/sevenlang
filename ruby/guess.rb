#!/usr/bin/env ruby

randNum = rand(10)

puts "Guess a number between 0 and 9: "
while input = gets
	if(input.to_i == randNum) 
		break
	end

	puts "Guess was too high. " if input.to_i > randNum

	puts "Guess was too low. " if input.to_i < randNum
		
	puts "Please try again: "

end