describe Location do

  it "return suggested locations" do

    expect(loc.suggested_locations).to include('newyork')
    expect(loc.suggested_locations).to include('boston')
    expect(loc.suggested_locations).to include('losangeles')
  end

  let(:loc) { Location.new }

  context "#location get and set methods" do
    it "return suggested locations" do
      expect(loc.suggested_locations).to include('newyork')
      expect(loc.suggested_locations).to include('boston')
      expect(loc.suggested_locations).to include('losangeles')
    end

    it "initializes with a default location of newyork " do
      location_object = Location.new
      expect(location_object.location).to eq('newyork')
    end
  end

  context "#single_market_check can take a market url and return the market without redirect" do
    it "return a string from a url redirect" do
      url = "http://geo.craigslist.org/iso/us/hi"
      expect(loc.single_market_check(url)).to eq('honolulu')
    end
  end
end
