
require 'pry'
require 'rmagick'


class MapImage
  attr_accessor :sample
  def initialize(sample=6)
    #sample size must be even
    @sample = sample
  end

  def get_hue(input)
    x, y = input.split(',')
    x = x.to_i - (sample/2)
    y = y.to_i - (sample/2)
    img = Magick::Image::read("app/img/20122015.png")[0]

    # binding.pry
    pixels_at_location = img.dispatch(x.to_i, y.to_i, sample, sample, "RGB")
    new_img = Magick::Image.constitute(sample, sample, "RGB", pixels_at_location)
    pix = new_img.scale(1,1)
    averageColor = pix.pixel_color(0,0)
    puts averageColor
    hue = averageColor.to_hsla.first
    puts hue
    #max is 240, min is 0
  end

  def get_pixels(coords)
    binding.pry
    x, y = coords.split(',')
    x = x.to_f.round(3)
    y = y.to_f.round(3)
    return "1142,579"
  end

  def convert_hue_to_percent(hue)
    percent = (hue/240)%100
  end
end
