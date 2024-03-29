#################
#  generate legendary moonbirds
#    using the official 42x42px attributes

require 'pixelart'



attributes_dir = './moonbirds-official/attributes'



COSMIC_GRADIENT       = Image.read( "#{attributes_dir}/gradients/cosmic.png" )
COSMIC_BODY_PROFESSOR = Image.read( "#{attributes_dir}/body-legendary/cosmic-legendary_professor.png" )
COSMIC_EYES_OPEN      = Image.read( "#{attributes_dir}/eyes-legendary/open_(cosmic).png")
COSMIC_BEAK_SMALL     = Image.read( "#{attributes_dir}/beak/small_(cosmic).png")

GLITCH_RED            = Image.new( 42, 42, '#ff0000' )
GLITCH_BODY_BRAVE     = Image.read( "#{attributes_dir}/body-legendary/glitch-legendary_brave.png" )
GLITCH_EYES_6         = Image.read( "#{attributes_dir}/eyes-legendary/glitch_6.png")

ENLIGHTENED_GRADIENT   =  Image.read( "#{attributes_dir}/gradients/enlightened.png" )
ENLIGHTENED_BODY_BRAVE =  Image.read( "#{attributes_dir}/body-legendary/enlightened-legendary_brave.png" )
ENLIGHTENED_EYES_OPEN  =  Image.read( "#{attributes_dir}/eyes-legendary/open_(enlightened).png")
ENLIGHTENED_BEAK_SMALL =  Image.read( "#{attributes_dir}/beak/small_(enlightened).png")


## Moonbird No. 6949
#    Background - Cosmic Purple
#    Body       - Cosmic
#    Feathers   - Legendary Professor
bird = Image.new( 42, 42 )
bird.compose!( COSMIC_GRADIENT )
bird.compose!( COSMIC_BODY_PROFESSOR )
bird.compose!( COSMIC_BEAK_SMALL )
bird.compose!( COSMIC_EYES_OPEN )


bird.save( "./tmp/moonbird6949.png" )
bird.zoom(8).save( "./tmp/moonbird6949@8x.png" )


## Moonbird No. 7473
#    Background -	Glitch Red
#    Body       - Glitch
#    Feathers	  - Legendary Brave
bird = Image.new( 42, 42 )
bird.compose!( GLITCH_RED )
bird.compose!( GLITCH_BODY_BRAVE )
bird.compose!( GLITCH_EYES_6 )


bird.save( "./tmp/moonbird7473.png" )
bird.zoom(8).save( "./tmp/moonbird7473@8x.png" )


## Moonbird No. 2941
#    Background - Enlightened Purple
#    Body       - Enlightened
#    Feathers   - Legendary Brave
bird = Image.new( 42, 42 )
bird.compose!( ENLIGHTENED_GRADIENT )
bird.compose!( ENLIGHTENED_BODY_BRAVE )
bird.compose!( ENLIGHTENED_BEAK_SMALL )
bird.compose!( ENLIGHTENED_EYES_OPEN )


bird.save( "./tmp/moonbird2941.png" )
bird.zoom(8).save( "./tmp/moonbird2941@8x.png" )



puts "bye"