#####
# to run use:
#   $ ruby lilmoonbirdies/composite.rb


require 'pixelart'


composite = ImageComposite.new( 100, 100,
                                width: 24, height: 24 )   ## 100x100 = 10000


ids = (1..10000)
ids.each do |id|
  puts "==> #{id}"
  img = Image.read( "./lilmoonbirdies/24x24/#{id}.png")

  composite << img
end

composite.save( "./tmp/lilmoonbirdies-24x24.png" )

puts "bye"

