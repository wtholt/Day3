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
		puts "Good luck!"
		puts "Dealer hand - #{dealer_hand}"
	end
	dealer_total = dealer_hand.flatten.inject(:+)
	if dealer_total >= 17
		puts "Dealer stays"
	else
		dealer_hand.push(cards.sample(1))
	end
	player_total = player_one.flatten.inject(:+)
	if player_total == 21
		@game_on = false
		puts "You win!"
	elsif player_total > 21
		@game_on = false
		puts "You bust"
	end
	puts "Would you like to hit or stay?"
	decision = gets.chomp
	if decision = "hit.downcase"
		player_total = player_one.flatten.inject(:+)
		player_one.push(cards.shuffle.pop(1))
		player_one.flatten
		puts "Player hand - #{player_one}"
	elsif decision = "stay.downcase"
		puts "Player stays"
	end
	
	

	
		

end


while @game_on
	blackjack(cards, player_one, dealer_hand)
end