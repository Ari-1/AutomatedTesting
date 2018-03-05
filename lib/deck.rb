require_relative 'card'

class Deck

attr_reader :cards

  def initialize
    @cards = []
    Card::ALL_SUITS.each do |suit|
      Card::VALUES.each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end



  def draw
    raise StandardError("Deck is empty") if @cards.empty?
    # draw one card at a time
    # show the card suit and value
    # card should no longer be in the deck
    return @cards.pop

  end
    # returns a card

  def count
    return @cards.length
  end

  def shuffle
    # shuffles the deck
    @cards.shuffle!
  end


end
