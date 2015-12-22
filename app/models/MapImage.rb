
require 'pry'
require 'rmagick'


class MapImage
  attr_accessor :sample
  def initialize(sample=10)
    #sample size must be even
    @sample = sample
  end

  def get_hue(input)
    y, x = input.split(',')
    x = x.to_i - (sample/2)
    y = y.to_i - (sample/2)
    img = Magick::Image::read("app/img/21122015.png")[0]

    pixels_at_location = img.dispatch(x.to_i, y.to_i, sample, sample, "RGB")
    new_img = Magick::Image.constitute(sample, sample, "RGB", pixels_at_location)
    pix = new_img.scale(1,1)
    averageColor = pix.pixel_color(0,0)
    hue = averageColor.to_hsla.first
  end

  def get_pixels(coords)
    lat, lng = coords.split(',')
    lat = lat.to_f
    lng = lng.to_f
    lat_pix = lat_convert(lat)
    lng_pix = lng_convert(lng)
    # binding.pry

    return "#{lat_pix.to_i},#{lng_pix.to_i}"
  end

  def lat_convert(lat)
    pix_per_degree = (938.0-141.0)/(55.904-22.0013)
    (55.904-lat)*pix_per_degree + 141
  end

  def lng_convert(lng)
    pix_per_degree = (1335.0-63.0)/(130.0-65.0)
    (130+lng)*pix_per_degree + 63
  end

  def convert_hue_to_percent(hue)
    percent = 100 - (hue/240)*100
  end
end
