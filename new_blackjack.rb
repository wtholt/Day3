cards = [2, 3, 4, 5, 6, 7, 8,
9, 10, 10, 10, 11, 2, 3, 4, 5, 6, 7,
8, 9, 10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 
8, 9 , 10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 11]

player_one = []

def blackjack cards, new_hand
	while new_hand.inject(:+) < 21
		puts "Your hand - #{new_hand.inject(:+)}"
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
		puts "Win"
	else
		puts "lose"
	end
end

cards.shuffle!
player_one.push(cards.pop)
player_one.push(cards.pop)

puts "Lets play Blackjack, here are your cards."

puts player_one

blackjack(cards, player_one)



			
