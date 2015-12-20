class Location
  # attr_accessor :location, :suggested_locations
  #
  # def initialize(*location)
  #   @location = location[0] ||= 'newyork'
  #   @suggested_locations = ['boston', 'newyork', 'sfbay', 'losangeles', 'washingtondc' ]
  # end
  #
  # def fetch_states
  #   scraper = CLLocationScraper.new
  #   states_with_link = scraper.get_states_hash
  #   output = ""
  #   states_with_link.each do |state, link|
  #      output << "#{state}, "
  #     end
  #   puts output
  #   puts "Type a state to see local markets or exit to head back to main menu"
  #
  #   input = get_user_input
  #
  #   if states_with_link.has_key?(input)
  #     choices = scraper.get_states_markets(states_with_link[input])
  #     return self.location = single_market_check("http:#{states_with_link[input]}") if choices == []
  #     choices.each.with_index(1) {|location, index| puts "#{index}. #{location}"}
  #     puts "type a market or number to set your local market"
  #     input = get_user_input
  #     if choices.include?(input)
  #       self.location = input
  #     elsif input.to_i > 0 && input.to_i <= choices.length
  #       self.location = choices[input.to_i-1]
  #     elsif input == 'exit'
  #       puts "  => Heading back to main menu!"
  #       return
  #     else
  #       puts "Invalid input, please type a states to try again"
  #       fetch_states
  #     end
  #   elsif input == 'exit'
  #     puts "  => Heading back to main menu!"
  #     return
  #   else
  #     puts "Invalid input, try again or type exit"
  #     fetch_states
  #   end
  # end
  #
  # def set_location
  #   puts "  Try one of these suggested markets or type 'states' to search markets by state: #{self.suggested_locations}"
  #   input = get_user_input
  #   if suggested_locations.include?(input)
  #     self.location = input
  #     puts "  location is set to #{self.location}"
  #   elsif input == 'states' || input == 's'
  #     fetch_states
  #     puts "  location is set to #{self.location}"
  #     return
  #   elsif input == 'exit'
  #     puts "  => Heading back to main menu!"
  #     return
  #   else
  #     puts "  Invalid entry"
  #     set_location
  #   end
  # end
  #
  # def single_market_check(url)
  #   result = Net::HTTP.get_response(URI.parse(url))['location']
  #   array = result.split(".")
  #   array[0].delete!("/")
  #   array[0]
  # end
  #
  # def get_user_input
  #   gets.chomp.strip
  # end
end
