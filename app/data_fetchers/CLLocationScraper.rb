class CLLocationScraper
  attr_reader :prices, :url, :location
  attr_accessor :html
  
  def initialize()
    @url = "http://newyork.craigslist.org"
    @html = Nokogiri::HTML(open(url))
  end

  def get_states_hash
    state_hash = {}
    html.search("div#rightbar > ul.menu > li:nth-child(3) > ul > li > a").map do |element|
      state_hash[element.text] = element.attr("href")
    end
    state_hash.delete('guam')
    state_hash.delete('more ...')
    state_hash
  end

  def get_states_markets(state_url)
    markets = Nokogiri::HTML(open("http:#{state_url}"))
    market_array = markets.search("ul#list li a").map do |e|
      array = e.attr("href").split(".")
      array[0].delete!("/")
      array[0]
    end
    market_array
  end
end
