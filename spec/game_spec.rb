require 'spec_helper'

describe Game do
  before :each do 
    #@game = Game.new 
  end
  
  it "should test bowling game" do 
    game = Game.new 
    20.times do |_|
      game.roll(0)
    end
    expect(game.score()).to eq(0) 
  end

  it "test all once" do 
    game = Game.new 
    20.times do |_|
      game.roll(1)
    end
    expect(game.score).to eq(20)
  end

  it "should test spare one" do 
    g = Game.new 
    g.roll(5)
    g.roll(5)
    g.roll(3)
    roll_many g, 17, 0
    expect(g.score).to eq(16)
  end

  def roll_many g, number, pins
    number.times do |_|
      g.roll(pins)
    end
  end
end
