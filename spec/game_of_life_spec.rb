=begin
RSpec.describe GameOfLife do
  it "has a version number" do
    expect(GameOfLife::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
=end
RSpec.describe GameOfLife::Tableros do
  tableros = GameOfLife::Tableros.new(2)
  it "board's large " do
    expect(tableros.large_boards).to eq(6)
  end

  it "board's width" do
    expect(tableros.width_board).to eq(18)
  end
  
  it "total squares" do
    expect(tableros.total_squares).to eq(36)
  end

end
