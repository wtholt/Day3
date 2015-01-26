cards = [2, 3, 4, 5, 6, 7, 8,
9, 10, 10, 10, 11, 2, 3, 4, 5, 6, 7,
8, 9, 10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 
8, 9 , 10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 11]

player_one = []
puts "Enter your name: "
@user_name = gets.chomp

def blackjack cards, new_hand

	while new_hand.inject(:+) < 21
		puts "Your hand - #{new_hand.inject(:+)}"
		puts "Hit or Stay #{@user_name}?"
		question = gets.chomp.downcase

		if question == "hit"
			new_hand.push(cards.pop)
			puts new_hand
			puts "Your hand - #{new_hand.inject(:+)}"
		elsif question == "stay"
			break
		end
	end

	if new_hand.inject(:+) <= 21
		puts "#{@user_name} wins!"
	else
		puts "#{@user_name} loses!"
	end
end

cards.shuffle!
player_one.push(cards.pop)
player_one.push(cards.pop)

puts "Lets play Blackjack, here are your cards: "

puts player_one.to_s

blackjack(cards, player_one)



			
