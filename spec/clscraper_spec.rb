# describe CLScraper do
#
#   VCR.use_cassette('support/scraper') do
#     binding.pry
#     let(:scraper) {CLScraper.new("bicycle", "newyork")}
#   end
#
#
#   it "initializes with a location argument" do
#     expect(scraper.location).to eq ("newyork")
#   end
#
#   it "initializes with an input argument" do
#     expect(scraper.url).to eq "http://newyork.craigslist.org/search/sss?query=bicycle"
#   end
#
#    describe "get-prices" do
#     it "gets an array of prices" do
#       VCR.use_cassette('support/get_prices') do
#         # stub_request(:get, "http://newyork.craigslist.org/")
#         prices = scraper.get_prices
#         expect(prices.is_a? Array).to eq(true)
#       end
#     end
#   end
# end
