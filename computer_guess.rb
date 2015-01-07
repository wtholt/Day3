puts "Can I guess a number between 1 and 100? "

computer_guess = rand(0..101)

correct_guess = 13

computer_guesses = 0

@game_on = true


def game computer_guess, correct_guess, computer_guesses
	puts computer_guess
	if computer_guess > correct_guess
		puts "Too high Mr. Computer"
	elsif computer_guess < correct_guess
		puts "Too low Mr. Computer"
	else
		@game_on = false
		"You got it! It took you #{computer_guesses}"
	end
end

while @game_on
	game(computer_guess, correct_guess, computer_guesses)
	computer_guess = rand(0..101)
	computer_guesses += 1
end
		