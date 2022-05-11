#####
# to run use:
#   $ ruby fastfoodmoonbirds/composite.rb


require 'pixelart'


composite = ImageComposite.new( 50, 100,
                                width: 42, height: 42 )   ## 50x100 = 5000


ids = (0..4999)
ids.each do |id|
  puts "==> #{id}"
  img = Image.read( "./fastfoodmoonbirds/42x42/#{id}.png")

  composite << img
end

composite.save( "./tmp/fastfoodmoonbirds-42x42.png" )

puts "bye"

