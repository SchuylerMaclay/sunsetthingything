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
    puts "where do you want to go"
    input = get_user_input
    if input == "help"
      help
    elsif input == "info"
      # binding.pry
    elsif input == "set location" || input == "s"
      puts "neat"
    elsif input == "exit"
      exit
    else
      puts "returning hue at location"
      search(input)
    end
    run
  end

  def search(input)
    hue = self.mapper.get_hue(input)
    puts hue

  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'info' to learn about how we filtered outliers"
    puts "Type 'set location' to change your Craigslist location."
    puts "Type 'list location' to see your Craigslist location."
    puts "Type 'help' to view this menu again."
    puts "Type 'open' to open the last search in the browser."
    puts "Type anything else to search for an average price."
  end
end
