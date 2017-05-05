require 'spec_helper'

describe Game do

  it "returns zero for no roll of pins" do 
    game = Game.new 
    roll_many game, 20, 0
    expect(game.score()).to eq(0) 
  end

  it "returns twenty for one pins at each time" do 
    game = Game.new 
    roll_many game, 20, 1
    expect(game.score).to eq(20)
  end

  it "should test for spare one" do 
    game = Game.new 
    roll_spare game
    game.roll(3)
    roll_many game, 17, 0
    expect(game.score).to eq(16)
  end

  it "should test for strike one" do 
    game = Game.new 
    roll_strike game
    game.roll(3)
    game.roll 4
    roll_many game, 16, 0
    expect(game.score).to eq(24)
  end

  it "should test perfect game" do 
    game = Game.new 
    roll_many(game, 12, 10)
    expect(game.score).to eq(300)
  end

  def roll_many game, number, pins
    number.times do |_|
      game.roll(pins)
    end
  end

  def roll_spare game
    game.roll(5)
    game.roll(5)
  end

  def roll_strike game
    game.roll 10
  end
end
