class SunsetWXScraper
attr_reader :html, :prices, :url, :location
def initialize()
  @url = "http://sunsetwx.com/"
  @html = Nokogiri::HTML(open(url))
end

def get_prices
  binding.pry
  src  = html.at('.profilePic img')['src']

  File.open("foo.png", "wb") do |f|
    f.write(open(src).read)
  end
end

end
