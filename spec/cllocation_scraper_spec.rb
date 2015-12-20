# describe CLLocationScraper do 
#   scraper = CLLocationScraper.new
#   it "initializes with url and html readers" do
#     #scraper = CLLocationScraper.new
#     expect{scraper.html}.not_to raise_error
#     expect(scraper.url).to eq("http://newyork.craigslist.org")
#     # expect(scraper.html).to eq(Nokogiri::HTML(open(url)))
#     end

#     context "#get_states_hash" do
#       #scraper = CLLocationScraper.new
#       it "creates a hash where the keys are the states and values are urls" do
#         expect(scraper.get_states_hash.has_key?("alabama")).to eq(true)
#         expect(scraper.get_states_hash.has_key?("wyoming")).to eq(true)
#         expect(scraper.get_states_hash.has_key?("maine")).to eq(true)
#         expect(scraper.get_states_hash.has_key?("ohio")).to eq(true)
#         expect(scraper.get_states_hash.has_key?("minnesota")).to eq(true)
#       end
#     end

#     context "#get_states_markets" do
#       #scraper = CLLocationScraper.new
#       hash = scraper.get_states_hash
#       it "populates an array with list of markets in a state" do 
#         expect(scraper.get_states_markets(hash["alabama"])).to include "auburn"
#         expect(scraper.get_states_markets(hash["ohio"])).to include "dayton"
#         expect(scraper.get_states_markets(hash["minnesota"])).to include "mankato"
#       end
#     end
#   end


