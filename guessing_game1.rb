number = rand(0..101)

puts "Please guess a number between 1 and 100: "

guess = gets.chomp.to_i

guesses = 0

def game number, guess, guesses
	if guess > number
		puts "Too high...keep trying!"
	elsif guess < number
		puts "Too low...keep trying!"
	else 
		game_on = false
		puts "Congrats! It took you #{guesses} guesses to figure it out!"
	end
end

game_on = true



while game_on
	game(number, guess, guesses)
	guess = gets.chomp.to_i
	guesses += 1	
end 


