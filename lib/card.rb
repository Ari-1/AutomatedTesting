
# card.rb

class Card

  ALL_SUITS = [:hearts, :spades, :clubs, :diamonds]

  FACE_CARDS = { 1 => "Ace", 11 => "Jack", 12 => "Queen", 13 => "King"}

  VALUES = (1..13)

  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit

    unless VALUES.include? value
      raise ArgumentError.new(ArgumentError)
    end

    unless ALL_SUITS.include?(@suit)
        raise ArgumentError.new(ArgumentError)
    end
  end

  def to_s
    FACE_CARDS.each do | key, value|
      if @value == key
        return "#{value} of #{suit.to_s}"
      end
    end
    return "#{value} of #{suit.to_s}"
  end


  def value
    FACE_CARDS.each do |num, face_value|
      if @value == num
        return "#{face_value}"
      end
    end
    return @value
  end


end
