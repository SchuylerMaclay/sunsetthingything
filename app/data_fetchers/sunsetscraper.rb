class SunsetWXScraper
  attr_reader :html, :prices, :url, :location
  def initialize()
    @url = "http://sunsetwx.com/"
    @html = Nokogiri::HTML(open(url))
    scrape_and_save_sunset_png
  end

  def scrape_and_save_sunset_png
    src  = html.css('div.post-content div:nth-child(2) a img').attr("src").value
    File.open("./app/img/#{Time.now.strftime("%d%m%Y")}.png", "w+") do |f|
      f.write(open(src).read)
    end
  end

end
