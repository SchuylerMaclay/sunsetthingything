require 'bundler/setup'
Bundler.require(:default, :development)
$: << '.'

Dir["app/concerns/*.rb"].each {|f| require f}
Dir["app/models/*.rb"].each {|f| require f}
Dir["app/data_fetchers/*.rb"].each {|f| require f}
Dir["app/runners/*.rb"].each {|f| require f}


require "json"
require "net/http"
require "nokogiri"
require "pry"
require 'open-uri'
require 'rmagick'
require 'geocoder'
