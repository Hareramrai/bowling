require 'spec_helper'

describe Game do
  before :each do 
    #@game = Game.new 
  end
  
  it "should test bowling game" do 
    game = Game.new 
    roll_many game, 20, 0
    expect(game.score()).to eq(0) 
  end

  it "test all once" do 
    game = Game.new 
    roll_many game, 20, 1
    expect(game.score).to eq(20)
  end

  it "should test spare one" do 
    g = Game.new 
    roll_spare g
    g.roll(3)
    roll_many g, 17, 0
    expect(g.score).to eq(16)
  end

  it "should test strike one" do 
    g = Game.new 
    roll_strike g
    g.roll(3)
    g.roll 4
    roll_many g, 16, 0
    expect(g.score).to eq(24)
  end

  it "should test perfect game" do 
    g = Game.new 
    roll_many(g,12,10);
    expect(g.score).to eq(300)
  end

  def roll_many g, number, pins
    number.times do |_|
      g.roll(pins)
    end
  end

  def roll_spare g 
    g.roll(5)
    g.roll(5)
  end

  def roll_strike g
    g.roll 10
  end
end
