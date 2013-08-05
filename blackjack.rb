

# method to calculate hand value

def card_value(cards)
  cards = cards.map { |a| a[1] }
  hand_total = 0

  cards.each do |card|
  	if card == 'Jack' or card == 'Queen' or card == 'King' 
  	  card_value = 10
  	  hand_total += card_value
  	elsif card == "Ace"
  	  card_value = 11
  	  hand_total += card_value
  	else
      card_value = card.to_i
      hand_total += card_value
    end
  end

  cards.select{ |a| a == "Ace"}.count.times do
    hand_total -= 10 if hand_total > 21
  end

  hand_total
end

def hit(cards)
  cards << decks.pop
end



puts "What's your name slick?"
name = gets.chomp
puts "OK #{name}, let's get this party started."

suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

deck1 = suits.product(cards)
deck2 = suits.product(cards)

# Creating mixed cards from 2 decks and shuffling
decks = deck1 << deck2
decks.shuffle!


# Dealing Cards
player_cards = []
dealer_cards = []

player_cards << decks.pop
dealer_cards << decks.pop
player_cards << decks.pop
dealer_cards << decks.pop


# Let player know his cards and tell him what the dealer is showing

puts "You look down at your cards and see the #{player_cards[0][1]} of #{player_cards[0][0]} and the #{player_cards[1][1]} of #{player_cards[1][0]}."
puts "player total =  #{card_value(player_cards)}"
if card_value(player_cards) == 21 
  puts "BlackJack!" 
end


# Let player make his decision to hit or stay
puts "The dealer's top card is a #{dealer_cards[1][1]} of #{dealer_cards[1][0]}."
puts "Remember that the dealer stays on 17."
puts ""

hand_total = card_value(player_cards)
status = true
while hand_total < 21 && status == true
  puts "What's your move? Enter 1 to hit and 2 to stay."
  player_move = gets.chomp
  if player_move == '1'
    player_cards << decks.pop
    hand_total = card_value(player_cards)
    puts "The dealer hands you a #{player_cards[-1][1]} of #{player_cards[-1][0]}"
    puts "Your new total is #{hand_total}"
  elsif player_move == '2'
   	hand_total = card_value(player_cards)
   	status = false
  else
   	puts "Enter a valid number"
   	status = true
  end
end

if hand_total > 21
  puts ""
  puts "BUSTED!"
  puts ""
end

# Start evaluating the dealer hands
dealer_total = card_value(dealer_cards)
puts "Okay let's see what the dealer has..."
puts ""
puts "The flips his 2nd card and shows a #{dealer_cards[0][1]} of #{dealer_cards[0][0]}. "
puts  "The dealer has a total of #{dealer_total}."

status = true
while dealer_total < 17
  puts "The dealer hits..."
  puts ""
  dealer_cards << decks.pop
  dealer_total = card_value(dealer_cards)
  puts "The dealer's new card is a #{dealer_cards[-1][1]} of #{dealer_cards[-1][0]}."
  puts "Their new total is #{dealer_total}."
end

if dealer_total > 21 && player_total > 21
  puts "The dealer busts!"
  puts ""
  puts "Unfortunately you busted too... it's a push."
end

if dealer_total < player_total && player_total < 22
  "Congrats you win!"
end

if dealer_total < 22 && player_total < 22 && player_total < dealer_total
  "The dealer beats you this time. Sorry!"
end

if dealer_total < 22 && player_total < 22 && player_total > dealer_total
  "Well done! You won!"
end




