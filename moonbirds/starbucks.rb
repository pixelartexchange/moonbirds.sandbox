#####
# to run use:
#   $ ruby moonbirds/starbucks.rb


require 'pixelart'




moonbirds = ImageComposite.new( 5, 3, width: 42, height: 42 )


starbucks        = Image.read( './fastfoodmoonbirds-iii/attributes/headwear/starbucks.png' )
starbucks_hat    = Image.read( './fastfoodmoonbirds/attributes/headwear/starbucks_hat.png')
starbucks_apron1 = Image.read( './fastfoodmoonbirds-iii/attributes/outerwear/starbucks_apron.png')
starbucks_apron2 = Image.read( './fastfoodmoonbirds/attributes/outfit/starbucks_apron.png')
coffee_boy       = Image.read( './fastfoodmoonbirds-iii/attributes/headwear/coffee_boy.png')


_3d_glasses          = Image.read( './moonbirds/attributes/eyewear/3d_glasses.png' )
sunglasses           = Image.read( './moonbirds/attributes/eyewear/sunglasses.png' )
# black_rimmed_glasses = Image.read( './moonbirds/attributes/eyewear/black-rimmed_glasses.png' )
# visor                = Image.read( './moonbirds/attributes/eyewear/visor.png' )
# gazelles             = Image.read( './moonbirds/attributes/eyewear/gazelles.png' )
# rose_colored_glasses = Image.read( './moonbirds/attributes/eyewear/rose-colored_glasses.png' )

## first row - add "nacked" attributes
moonbirds << starbucks
moonbirds << starbucks_hat
moonbirds << starbucks_apron1
moonbirds << starbucks_apron2
moonbirds << coffee_boy



base = Image.read( './moonbirds/42x42/2404.png' )
base = base.transparent

## second row
moonbird = Image.new( 42, 42, '#046241' )
moonbird.compose!( base )
moonbird.compose!( starbucks )
moonbirds << moonbird

moonbird = Image.new( 42, 42, '#046241' )
moonbird.compose!( base )
moonbird.compose!( starbucks_hat )
moonbirds << moonbird

moonbird = Image.new( 42, 42, '#046241' )
moonbird.compose!( base )
moonbird.compose!( starbucks_apron1 )
moonbirds << moonbird

moonbird = Image.new( 42, 42, '#046241' )
moonbird.compose!( base )
moonbird.compose!( starbucks_apron2 )
moonbirds << moonbird

moonbird = Image.new( 42, 42, '#046241' )
moonbird.compose!( base )
moonbird.compose!( coffee_boy )
moonbirds << moonbird


## third row

moonbird = Image.new( 42, 42, '#1A3C34' )
moonbird.compose!( base )
moonbird.compose!( starbucks )
moonbird.compose!( starbucks_apron1 )
moonbirds << moonbird

moonbird = Image.new( 42, 42, '#046241' )
moonbird.compose!( base )
moonbird.compose!( starbucks_hat )
moonbird.compose!( starbucks_apron2 )
moonbirds << moonbird

moonbird = Image.new( 42, 42, '#00754A' )
moonbird.compose!( base )
moonbird.compose!( starbucks )
moonbird.compose!( starbucks_apron1 )
moonbird.compose!( sunglasses )
moonbirds << moonbird

moonbird = Image.new( 42, 42, '#02A178'  )
moonbird.compose!( base )
moonbird.compose!( starbucks_hat )
moonbird.compose!( starbucks_apron2 )
moonbird.compose!( _3d_glasses )
moonbirds << moonbird

moonbird = Image.new( 42, 42, 'red' )
moonbird.compose!( base )
moonbird.compose!( coffee_boy )
moonbird.compose!( starbucks_apron1 )
moonbirds << moonbird.mirror






moonbirds.save( "./tmp/moonbirds-starbucks.png" )
moonbirds.zoom(4).save( "./tmp/moonbirds-starbucks@4x.png" )

