require "tic_tac_toe2"

describe Game do
  subject do
	player = Game.new
	player.instance_variable_set(:@board, [1, "0", 3, "x", "x", "x", "0", 8, "0" ])
	player
  end
  it "Makes game_over? return true" do
    expect(subject.game_over?).to eql(true)
  end
  it "Doesn't modify a taken space" do
      expect(subject.player_turn(4)).to eql(nil)
  end
end
