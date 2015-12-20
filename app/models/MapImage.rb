
require 'pry'
require 'rmagick'

class MapImage
  def get_hue(input)
    x, y = input.split(',')
    img = Magick::Image::read("app/img/20122015.png")[0]

    # binding.pry
    pixels_at_location = img.dispatch(x.to_i, y.to_i, 20, 20, "RGB")
    new_img = Magick::Image.constitute(20, 20, "RGB", pixels_at_location)
    pix = new_img.scale(1,1)
    averageColor = pix.pixel_color(0,0)
    hue = averageColor.to_hsla.first
    #max is 0.6666, min is 0
    # binding.pry
  end
end
