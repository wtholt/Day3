number = rand(0..101)

puts "Please guess a number between 1 and 100: "

guess = gets.chomp.to_i

guess_counter = 0


def game number, guess
	if guess > number
		puts "Too high...keep trying!"
	elsif guess < number
		puts "Too low...keep trying!"
	else 
		puts "Congrats! It took you #{guess_counter} many guesses."
	end
end

game_on = true


while game_on
	game(number, guess)
	guess = gets.chomp.to_i
	guess_counter += 1	
end


