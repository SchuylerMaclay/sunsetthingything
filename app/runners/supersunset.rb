class SunsetCLI
  attr_accessor :scraper, :mapper

  def call
    puts "Welcome to SuperSunsetter!"
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
      puts ""
      puts "coordinates for #{input} are #{coords}"
      pixel_coords = self.mapper.get_pixels(coords)
      puts "pixel coords: #{pixel_coords}"
      hue = determine_hue(pixel_coords)
      # binding.pry
      # puts "Hue: #{hue}"
    end
    run
  end

  def get_coords(user_input)
    results = Geocoder.search(user_input)
    lat = results.first.data["geometry"]['location']['lat']
    lng = results.first.data["geometry"]['location']['lng']
    return "#{lat},#{lng}"
  end

  def determine_hue(pix_coords)
    hue = mapper.get_hue(pix_coords)
    puts "Hue is #{hue}.  (red is 0, blue is 240)."
    puts ""
    puts "Tonight's sunset will be #{mapper.convert_hue_to_percent(hue).round(2)}% awesome!"
    if mapper.convert_hue_to_percent(hue)>80
      puts "get out there and take some pics"
      puts ""
    end
    hue
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' display this menu."
    puts "Type a location to get started."
  end
end
