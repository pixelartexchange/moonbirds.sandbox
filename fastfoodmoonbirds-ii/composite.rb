#####
# to run use:
#   $ ruby fastfoodmoonbirds-ii/composite.rb


require 'pixelart'


composite = ImageComposite.new( 25, 40,
                                width: 42, height: 42 )   ## 25x40= 1000


ids = (1..1000)
ids.each do |id|
  puts "==> #{id}"
  img = Image.read( "./fastfoodmoonbirds-ii/42x42/#{id}.png")

  composite << img
end

composite.save( "./tmp/fastfoodmoonbirds-ii-42x42.png" )

puts "bye"

