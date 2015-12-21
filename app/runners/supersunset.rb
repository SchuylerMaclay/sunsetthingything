class SunsetCLI
  attr_accessor :scraper, :mapper

  def call
    puts "Welcome to our dumb app!"
    puts "  type help for a list of commands"
    @scraper = SunsetWXScraper.new
    @mapper = MapImage.new
    run
  end

  def get_user_input
    gets.chomp.strip
  end

  def run
    puts "where do you want to know the sunset for?"
    input = get_user_input
    if input == "help"
      help
    elsif input == "info"
      # binding.pry
      puts "neat"
    elsif input == "exit"
      exit
    else
      coords = get_coords(input)
      pixel_coords = self.mapper.get_pixels(coords)
      determine_hue(pixel_coords)
    end
    run
  end

  def get_coords(input)
    results = Geocoder.search(input)
    lat = results.first.data["geometry"]['location']['lat']
    lng = results.first.data["geometry"]['location']['lng']
    puts "lat: #{lat}, long: #{lng}."
    return "#{lat},#{lng}"
  end

  def determine_hue(pix_coords)
    hue = self.mapper.get_hue(pix_coords)
    puts hue

  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'info' to learn about how we filtered outliers"
    puts "Type 'open' to open the last search in the browser."
    puts "Type a location to get started."
  end
end
