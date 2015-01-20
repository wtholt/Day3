number = rand(0..101)


guesses = 0

@game_on = true

def game number, guess, guesses
	if guess > number
		puts "Too high...keep trying!"
	elsif guess < number
		puts "Too low...keep trying!"
	else
		@game_on = false
		puts "Congrats! It took you #{guesses} guesses to figure it out!"
		
	end
end

while @game_on
	puts "Please guess a number between 1 and 100: "
	guess = gets.chomp.to_i
	game(number, guess, guesses)
	guesses += 1
	if guesses >= 5
		@game_on = false
		puts "You are only allowed 5 guesses"
	else
	end
end 


