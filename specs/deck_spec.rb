

require_relative 'spec_helper'

describe Deck do

  before do
    @deck = Deck.new
  end

  describe 'constructor' do
    it 'can be created' do
      @deck.must_be_instance_of Deck
    end

    it 'creates a list of 52 cards' do
      @deck.cards.must_be_instance_of Array
      @deck.cards.length.must_equal 52
      @deck.cards.each do |card|
        card.must_be_instance_of Card
      end
    end
  end

# will only pass if you say something = Object.new
# (something.must_be_instance_of Object)

# will always pass, because every class is
# a subclass of Object
# (something.must_be_kind_of Object)


  describe 'shuffle' do
    it 'is a method you can call' do
      # must_respond_to does not check that the method works
      # only invoking the method .shuffle-- will check that
      # the method is working
      @deck.must_respond_to :shuffle
      @deck.shuffle
    end
  end

  describe 'draw' do
    it 'returns a card' do
      card = @deck.draw
      card.must_be_instance_of Card
    end
    it 'removes that card from the deck' do
      start_length = @deck.cards.length

      card = @deck.draw

      (@deck.cards.include? card).must_equal false
      @deck.cards.length.must_equal start_length - 1
    end

    it 'lets you draw all 52 cards' do
      52.times do
        @deck.draw
      end
      @deck.cards.must_be_empty
    end
    it 'raises an error when you draw from empty deck' do
      52.times do
        @deck.draw
      end
      # must_raise will provide an StandardError
    proc { @deck.draw }.must_raise # StandardError
    end

  end


  describe 'count' do
    it 'counts the cards in the deck' do
      10.times do
        @deck.draw
      end
      @deck.count.must_equal 42
      end
    end

  end


  # Write tests for the Deck class.
  # What should you test?
    # 1.  Expected Behavior
    # 2.  Edge cases
