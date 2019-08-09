RSpec.describe GameOfLife::Play do
  tab = GameOfLife::Tableros.new
  play = GameOfLife::Play.new(tab) 
  context "validated rows" do
    it "validated rows " do
      expect(play.eval(1,2,'0')).to eq('0')
    end 
  end

  context "rulers" do
    it "check rulers" do
      expect(play.rulers(2, '0')).to eq('.')
    end
  end
end
