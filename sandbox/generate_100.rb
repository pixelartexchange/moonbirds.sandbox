#####
# to run use:
#   $ ruby sandbox/generate_100.rb


require 'pixelart'


def gen_composite( slug,
                   offset: 0,
                   width: 42, height: 42,
                   transparent: false, mirror: false, background: nil )

  # use a 10x10 grid for a hundred (100) items
  composite = ImageComposite.new( 10, 10, width: width, height: height )

  (offset..offset+99).each do |id|

    tile = Image.read( "./#{slug}/#{width}x#{height}/#{id}.png" )
    tile = tile.transparent               if transparent

    if background
      img = Image.new( width, height, background )
      img.compose!( tile )
      tile = img
    end

    tile = tile.mirror                    if mirror
    composite << tile
  end
  composite
end



composite = gen_composite( "fastfoodmoonbirds",  mirror: true )
composite.save( "./tmp/fastfoodmoonbirds_100-42x42.png" )

composite = gen_composite( "fastfoodmoonbirds-ii",  offset: 1, mirror: true )
composite.save( "./tmp/fastfoodmoonbirds-ii_100-42x42.png" )


puts "bye"

