cards = [2, 3, 4, 5, 6, 7, 8,
9, 10, 10, 10, 11, 2, 3, 4, 5, 6, 7,
8, 9, 10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 
8, 9 , 10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 11]

player_one = []
dealer_hand = []

@game_on = true

def blackjack cards, player_one, dealer_hand
	if player_one.length == 0
		player_one.push(cards.shuffle.pop(2))
		player_one = player_one.flatten
		puts "Player hand - #{player_one}" 
	end
	if dealer_hand.length == 0
		dealer_hand.push(cards.shuffle.pop(2))
		dealer_hand = dealer_hand.flatten
		puts "Dealer hand - #{dealer_hand}"
	end
end

def dealer cards, dealer_hand
	dealer_hand = dealer_hand.flatten
	if dealer_hand.inject(:+) <= 17
		puts "Dealer hits"
		hit_dealer_hand = dealer_hand.push(cards.shuffle.pop(1))
		hit_dealer_hand = hit_dealer_hand.flatten
		if hit_dealer_hand > 21
			puts "Dealer busts"
			@game_on = false
		elsif hit_dealer_hand <= 17
			puts "Dealer hits again"
			again_hit_dealer_hand = again_hit_dealer_hand.flatten
			again_hit_dealer_hand = hit_dealer_hand.push(cards.shuffle.pop(1))
			if again_hit_dealer_hand > 21
				puts "Dealer busts"
				@game_on = false
			end
		end

	elsif dealer_hand.inject(:+) == 21
		puts "Dealer wins!"
		puts "Dealer hand - #{dealer_hand}"
		@game_on = false
	elsif dealer_hand.inject(:+) > 21
		puts "Dealer busts!"
		puts "Dealer hand - #{dealer_hand}"
		@game_on = false
	end
end

def player cards, player_one
	player_one = player_one.flatten
	if player_one.inject(:+) < 21
		puts "Would you like to hit or stay?"
		question = gets.chomp
		if question == "hit"
			player_one.push(cards.shuffle.pop(1))
			puts "Player hand - #{player_one}"
		elsif question == "stay"
			puts "Player hand - #{player_one}"


		end
	elsif player_one.inject(:+) > 21
		puts "Player busts!"
		puts "Player hand - #{player_one}"
		@game_on = false
	elsif player_one.inject(:+) == 21
		puts "Player wins!"
		puts "Player hand - #{player_one}"
		@game_on = false
	end
end

def player_dealer cards, player_one, dealer_hand
	player_one = player_one.flatten
	dealer_hand = dealer_hand.flatten
	if player_one.inject(:+) > dealer_hand.inject(:+)
		puts "Player wins!"
		puts "Dealer hand - #{dealer_hand}"
		puts "Player hand - #{player_one}"
		@game_on = false
	elsif player_one.inject(:+) < dealer_hand.inject(:+)
		puts "Dealer wins!"
		puts "Dealer hand - #{dealer_hand}"
		puts "Player hand - #{player_one}"
		@game_on = false
	elsif player_one.inject(:+) == dealer_hand.inject(:+)
		puts "It's a draw!"
		puts "Dealer hand - #{dealer_hand}"
		puts "Player hand - #{player_one}"
	end
end
		


while @game_on
	blackjack(cards, player_one, dealer_hand)
	dealer(cards, dealer_hand)
	player(cards, player_one)
	player_dealer(cards, player_one, dealer_hand)
end