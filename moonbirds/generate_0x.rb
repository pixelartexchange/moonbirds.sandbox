#####
# to run use:
#   $ ruby generate_0x.rb


require 'pixelart'



beak_small_orange  = Image.read( "./attributes/beak/small-orange.png" )
beak_small_gray    = Image.read( "./attributes/beak/small-gray.png" )

eyes_open_blue   = Image.read( "./attributes/eyes/open-blue.png" )
eyes_open_white  = Image.read( "./attributes/eyes/open-white.png" )
eyes_open_red    = Image.read( "./attributes/eyes/open-red.png" )

_3d_glasses = Image.read( "./attributes/eyewear/3d_glasses.png" )
visors      = Image.read( "./attributes/eyewear/visor.png" )
rose_colored_glasses = Image.read( "./attributes/eyewear/rose-colored_glasses.png" )
gazelles    = Image.read( "./attributes/eyewear/gazelles.png" )

lincoln       = Image.read( "./attributes/headwear/lincoln.png" )
backwards_hat = Image.read( "./attributes/headwear/backwards_hat.png" )
headband     = Image.read( "./attributes/headwear/headband.png" )
# wizards_hat  = Image.read( "./attributes/headwear/wizards_hat.png" )
flowers     = Image.read( "./attributes/headwear/flowers.png" )
bandana     = Image.read( "./attributes/headwear/bandana.png" )
bow          = Image.read( "./attributes/headwear/bow.png" )
queens_crown = Image.read( "./attributes/headwear/queens_crown.png" )
fire         = Image.read( "./attributes/headwear/fire.png" )




bodies_white = [
  'emperor',
  'guardian',
  'professor',
  'stark',
  'tabby',
  'tranquil',
].map { |body| Image.read( "./attributes/body/#{body}-white.png" ) }


moonbirds = ImageComposite.new( 6, 4, width: 42, height: 42 )

(0..3).each do |series|
  bodies_white.each do |body|
    background = if series == 0
                    0 # use (default) transparent
                 else
                     '#FFBF00'  # use golden 0x/extension background
                 end

    moonbird = Image.new( 42, 42, background )

    moonbird.compose!( body )
    moonbird.compose!( beak_small_orange )     if series == 1 || series == 2
    moonbird.compose!( eyes_open_red )         if series == 1
    moonbird.compose!( eyes_open_white )       if series == 2
    moonbird.compose!( bow )                   if series == 2

    moonbird.compose!( beak_small_gray )       if series == 3
    moonbird.compose!( eyes_open_blue )        if series == 3
    moonbird.compose!( queens_crown )          if series == 3

    moonbirds << moonbird
  end
end


moonbirds.save( "./tmp/moonbirds-bodies_white.png" )
moonbirds.zoom(3).save( "./tmp/moonbirds-bodies_white@3x.png" )



bodies_red = [
  'brave',
  'crescent',
  'emperor',
  'guardian',
  'professor',
  'sage',
  'tabby',
  'tranquil',
].map { |body| Image.read( "./attributes/body/#{body}-red.png" ) }

moonbirds = ImageComposite.new( 8, 3, width: 42, height: 42 )


(0..2).each do |series|
  bodies_red.each do |body|
    background = if series == 0
                     0 # use (default) transparent
                else
                     '#FFBF00'  # use golden 0x/extension background
                 end

    moonbird = Image.new( 42, 42, background )

    moonbird.compose!( body )
    moonbird.compose!( beak_small_orange )  if series == 1 || series == 2
    moonbird.compose!( _3d_glasses )        if series == 1 || series == 2
    moonbird.compose!( headband )           if series == 2

    moonbirds << moonbird
  end
end


moonbirds.save( "./tmp/moonbirds-bodies_red.png" )
moonbirds.zoom(3).save( "./tmp/moonbirds-bodies_red@3x.png" )



bodies_brown = [
 'brave',
 'crescent',
 'emperor',
 'guardian',
 'sage',
  'stark',
  'tabby',
  'tranquil',
].map { |body| Image.read( "./attributes/body/#{body}-brown.png" ) }

moonbirds = ImageComposite.new( 8, 4, width: 42, height: 42 )

(0..3).each do |series|
  bodies_brown.each do |body|
    background = if series == 0
                    0 # use (default) transparent
                 else
                     '#FFBF00'  # use golden 0x/extension background
                 end

    moonbird = Image.new( 42, 42, background )

    moonbird.compose!( body )
    moonbird.compose!( beak_small_orange )     if series != 0
    moonbird.compose!( rose_colored_glasses )  if series == 1 || series == 2
    moonbird.compose!( flowers )               if series == 2
    moonbird.compose!( gazelles )              if series == 3
    moonbird.compose!( bandana )               if series == 3

    moonbirds << moonbird
  end
end


moonbirds.save( "./tmp/moonbirds-bodies_brown.png" )
moonbirds.zoom(3).save( "./tmp/moonbirds-bodies_brown@3x.png" )



body_skeleton        = Image.read( "./attributes/body/skeleton.png" )
beak_small_skeleton  = Image.read( "./attributes/beak/small-skeleton.png" )

bodies_ruby_skeleton = [
  'eyes/adorable-skeleton',
  'eyes/open-skeleton',
  'eyes/angry-skeleton',
  'eyes/relaxed-skeleton',
  'eyewear/visor',
  'eyewear/sunglasses',
].map { |attribute|
   moonbird = Image.new( 42, 42 )
   moonbird.compose!( body_skeleton )
   moonbird.compose!( beak_small_skeleton )
   moonbird.compose!( Image.read( "./attributes/#{attribute}.png"))
   moonbird
}

moonbirds = ImageComposite.new( 6, 4, width: 42, height: 42 )

(0..3).each do |series|
  bodies_ruby_skeleton.each do |body|
    background = if series == 0
                    0 # use (default) transparent
                 else
                     '#FFBF00'  # use golden 0x/extension background
                 end

    moonbird = Image.new( 42, 42, background )

    moonbird.compose!( body )
    moonbird.compose!( flowers )       if series == 1
    moonbird.compose!( lincoln )       if series == 2
    moonbird.compose!( backwards_hat ) if series == 3

    moonbirds << moonbird
  end
end


moonbirds.save( "./tmp/moonbirds-bodies_skeleton.png" )
moonbirds.zoom(3).save( "./tmp/moonbirds-bodies_skeleton@3x.png" )



body_ruby_skeleton = Image.read( "./attributes/body/ruby_skeleton.png" )
beak_small_ruby    = Image.read( "./attributes/beak/small-ruby.png" )

bodies_ruby_skeleton = [
  'eyes/adorable-skeleton',
  'eyes/open-skeleton',
  'eyes/angry-skeleton',
  'eyes/relaxed-skeleton',
  'eyewear/3d_glasses',
  'eyewear/sunglasses',
].map { |attribute|
   moonbird = Image.new( 42, 42 )
   moonbird.compose!( body_ruby_skeleton )
   moonbird.compose!( beak_small_ruby )
   moonbird.compose!( Image.read( "./attributes/#{attribute}.png"))
   moonbird
}

moonbirds = ImageComposite.new( 6, 4, width: 42, height: 42 )

(0..3).each do |series|
  bodies_ruby_skeleton.each do |body|
    background = if series == 0
                    0 # use (default) transparent
                 else
                     '#FFBF00'  # use golden 0x/extension background
                 end

    moonbird = Image.new( 42, 42, background )

    moonbird.compose!( body )
    moonbird.compose!( bow )           if series == 1
    moonbird.compose!( fire )          if series == 2
    moonbird.compose!( queens_crown )  if series == 3

    moonbirds << moonbird
  end
end


moonbirds.save( "./tmp/moonbirds-bodies_ruby_skeleton.png" )
moonbirds.zoom(3).save( "./tmp/moonbirds-bodies_ruby_skeleton@3x.png" )


puts "bye"


