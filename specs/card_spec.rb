
require_relative 'spec_helper'

describe Card do
  describe "You can create a Card instance" do

    it "Can be created" do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          card.must_be_instance_of Card
        end
      end
    end

    it "Raises an ArgumentError for invalid parameters" do
      # To raise an ArgumentError in card.rb
      # raise ArgumentError.new
      proc {Card.new(0, :diamonds)}.must_raise ArgumentError
      proc {Card.new(14, :diamonds)}.must_raise ArgumentError
      proc {Card.new(13, :clovers)}.must_raise ArgumentError
    end
  end

  describe "Testing to_s" do

    it "to_s returns a readable String value logically for values 2-10" do
      new_card = Card.new(2, :diamonds)

      new_card.to_s.must_equal "2 of diamonds"
    end

    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      ace_card = Card.new(1, :hearts)
      jack_card = Card.new(11, :diamonds)
      queen_card = Card.new(12, :spades)
      king_card = Card.new(13, :hearts)

      ace_card.to_s.must_equal "Ace of hearts"
      jack_card.to_s.must_equal "Jack of diamonds"
      queen_card.to_s.must_equal "Queen of spades"
      king_card.to_s.must_equal "King of hearts"
    end
  end

  describe "Reader methods" do

    it "Can retrieve the value of the card using a `.value`." do
      new_card = Card.new(2, :hearts)
      queen_card = Card.new(12, :hearts)

      new_card.value.must_equal 2
      queen_card.value.must_equal "Queen"
    end

    it "Can retrieve the value of the card using a `.suit`." do
      new_card = Card.new(2, :clubs)
      queen_card = Card.new(12, :hearts)

      new_card.suit.must_equal :clubs
      queen_card.suit.must_equal :hearts
    end
  end

end
