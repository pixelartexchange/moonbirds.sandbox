#####
# to run use:
#   $ ruby sandbox/strips.rb


require 'pixelart'


def gen_strip( slug, offset: 0, width: 42, height: 42 )
  strip = ImageComposite.new( 9, 1, width: width, height: height )

  (offset..offset+8).each do |id|
    strip << Image.read( "./#{slug}/#{width}x#{height}/#{id}.png" )
  end
  strip
end


strip = gen_strip( "fastfoodmoonbirds")
strip.save( "./tmp/fastfoodmoonbirds-strip.png" )


strip = gen_strip( "fastfoodmoonbirds-ii", offset: 1 )
strip.save( "./tmp/fastfoodmoonbirds-ii-strip.png" )


strip = gen_strip( "lilmoonbirdies", width: 24, height: 24, offset: 1 )
strip.save( "./tmp/lilmoonbirdies-strip.png" )


strip = gen_strip( "moonbirds" )
strip.save( "./tmp/moonbirds-strip.png" )


strip = gen_strip( "starbirds" )
strip.save( "./tmp/starbirds-strip.png" )



puts "bye"


