class Lomo
  attr :file
  attr :dest
  attr :mask

  def initialize(file)
    @file = File.expand_path(file)
    @dest = @file.sub /\.jpg$/i, "-lomo.png"
    @mask = File.join(File.dirname(__FILE__), "../img/mask.png")

    unless File.exists?(@file)
      usage
      exit
    end
  end

  def usage
    puts <<-eos
      Usage:
        lomo path_to_image.jpg

      It will generate a 1024x768 version of the image with
      the lomo filter applied. ImageMagick is required for this
      to work.
    eos
  end

  def process
    `cp #{file} #{dest}`
    `convert -resize 1024x768 #{dest} #{dest}`
    `cp #{dest} #{dest}-resized`
    `convert -unsharp 1 #{dest} #{dest}`
    `convert -contrast -contrast #{dest} #{dest}`
    `convert -modulate 100,150 #{dest} #{dest}`
    `composite -compose overlay #{mask} #{dest} #{dest}`
    `composite -compose multiply #{dest}-resized #{dest} #{dest}`
    `rm #{dest}-resized`
    `open #{dest}`
  end
end
