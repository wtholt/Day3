cards = [2, 3, 4, 5, 6, 7, 8,
9, 10, 10, 10, 11, 2, 3, 4, 5, 6, 7,
8, 9, 10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 
8, 9 , 10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 11]

player_one = []
dealer_hand = []

@game_on = true

def blackjack cards, player_one, dealer_hand
	player_one = player_one.flatten.inject(:+)
	dealer_hand = dealer_hand.flatten.inject(:+)
	if player_one == 0
		player_one.push(cards.shuffle.pop(2))
		puts "Player hand - #{player_one}" 
	end
	if dealer_hand == 0
		dealer_hand.push(cards.shuffle.pop(2))
		puts "Good luck!"
		puts "Dealer hand - #{dealer_hand}"
	end
	if dealer_hand <= 17
		dealer_hand.push(cards.shuffle.pop(1))
	elsif dealer_hand == 21
		puts "Dealer wins"
		@game_on = false
	elsif dealer_hand > 21
		puts "Dealer busts"
		@game_on = false
	elsif player_one < 21
		puts "Would you like to hit or stay?"
		question = gets.chomp
		if question == "Hit.downcase"
			player_one.push(cards.shuffle.pop(1))
		else
			puts "Player stays"
		end
	elsif player_one == 21
		puts "Player wins"
		@game_on = false
	elsif player_one > 21
		puts "Player busts"
	elsif player_one > dealer_hand
		puts "Player wins"
		@game_on = false
	elsif player_one < dealer_hand
		puts "Dealer wins"
		@game_on = false
	end
end


while @game_on
	blackjack(cards, player_one, dealer_hand)
end