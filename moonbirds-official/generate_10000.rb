#################
#  generate 10 000 moonbirds
#    using the official 42x42px attributes and metadata
#
#   to run use:
#    $ ruby moonbirds-official/generate_10000.rb



require 'pixelart'
require 'backgrounds'



def slugify( str )
  str.downcase.gsub( /[ '()_-]/, '' )
end



## build attributes lookup hash table with all images

paths = %w[
  body/brave-black.png
  body/brave-blue.png
  body/brave-brown.png
  body/brave-gray.png
  body/brave-green.png
  body/brave-pink.png
  body/brave-purple.png
  body/brave-red.png
  body/brave-white.png
  body/crescent-black.png
  body/crescent-blue.png
  body/crescent-brown.png
  body/crescent-gray.png
  body/crescent-green.png
  body/crescent-pink.png
  body/crescent-purple.png
  body/crescent-red.png
  body/crescent-white.png
  body/emperor-black.png
  body/emperor-blue.png
  body/emperor-brown.png
  body/emperor-gray.png
  body/emperor-green.png
  body/emperor-pink.png
  body/emperor-purple.png
  body/emperor-red.png
  body/emperor-white.png
  body/guardian-black.png
  body/guardian-blue.png
  body/guardian-brown.png
  body/guardian-gray.png
  body/guardian-green.png
  body/guardian-pink.png
  body/guardian-purple.png
  body/guardian-red.png
  body/guardian-white.png
  body/professor-black.png
  body/professor-blue.png
  body/professor-brown.png
  body/professor-gray.png
  body/professor-green.png
  body/professor-pink.png
  body/professor-purple.png
  body/professor-red.png
  body/professor-white.png
  body/sage-black.png
  body/sage-blue.png
  body/sage-brown.png
  body/sage-gray.png
  body/sage-green.png
  body/sage-pink.png
  body/sage-purple.png
  body/sage-red.png
  body/sage-white.png
  body/stark-black.png
  body/stark-blue.png
  body/stark-brown.png
  body/stark-gray.png
  body/stark-green.png
  body/stark-pink.png
  body/stark-purple.png
  body/stark-red.png
  body/stark-white.png
  body/tabby-black.png
  body/tabby-blue.png
  body/tabby-brown.png
  body/tabby-gray.png
  body/tabby-green.png
  body/tabby-pink.png
  body/tabby-purple.png
  body/tabby-red.png
  body/tabby-white.png
  body/tranquil-black.png
  body/tranquil-blue.png
  body/tranquil-brown.png
  body/tranquil-gray.png
  body/tranquil-green.png
  body/tranquil-pink.png
  body/tranquil-purple.png
  body/tranquil-red.png
  body/tranquil-white.png

  body-skeleton/ruby_skeleton-legendary_bone.png
  body-skeleton/skeleton-bone.png

  body-robot/robot-metal.png

  body-legendary/cosmic-legendary_brave.png
  body-legendary/cosmic-legendary_crescent.png
  body-legendary/cosmic-legendary_emperor.png
  body-legendary/cosmic-legendary_guardian.png
  body-legendary/cosmic-legendary_professor.png
  body-legendary/cosmic-legendary_sage.png
  body-legendary/enlightened-legendary_brave.png
  body-legendary/enlightened-legendary_crescent.png
  body-legendary/enlightened-legendary_emperor.png
  body-legendary/enlightened-legendary_guardian.png
  body-legendary/enlightened-legendary_professor.png
  body-legendary/enlightened-legendary_sage.png
  body-legendary/glitch-legendary_brave.png
  body-legendary/glitch-legendary_crescent.png
  body-legendary/glitch-legendary_emperor.png
  body-legendary/glitch-legendary_guardian.png
  body-legendary/glitch-legendary_professor.png
  body-legendary/glitch-legendary_sage.png
  body-legendary/golden-legendary_crescent.png
  body-legendary/golden-legendary_emperor.png
  body-legendary/golden-legendary_professor.png
  body-legendary/golden-legendary_sage.png
  body-legendary/jade-legendary_brave.png
  body-legendary/jade-legendary_crescent.png
  body-legendary/jade-legendary_emperor.png
  body-legendary/jade-legendary_guardian.png
  body-legendary/jade-legendary_professor.png
  body-legendary/jade-legendary_sage.png

  beak/long-golden.png
  beak/long-gray.png
  beak/long-orange.png
  beak/long-robot.png
  beak/long-ruby.png
  beak/long-skeleton.png
  beak/short-golden.png
  beak/short-gray.png
  beak/short-orange.png
  beak/short-robot.png
  beak/short-ruby.png
  beak/short-skeleton.png
  beak/small-golden.png
  beak/small-gray.png
  beak/small-orange.png
  beak/small-robot.png
  beak/small-ruby.png
  beak/small-skeleton.png

  beak-legendary/short_(jade).png
  beak-legendary/small_(cosmic).png
  beak-legendary/small_(enlightened).png
  beak-legendary/small_(jade).png


  eyes/angry-blue.png
  eyes/angry-gray.png
  eyes/angry-green.png
  eyes/angry-purple.png
  eyes/angry-red.png
  eyes/angry-white.png
  eyes/angry-yellow.png
  eyes/discerning-blue.png
  eyes/discerning-gray.png
  eyes/discerning-green.png
  eyes/discerning-purple.png
  eyes/discerning-red.png
  eyes/discerning-white.png
  eyes/discerning-yellow.png
  eyes/open-blue.png
  eyes/open-gray.png
  eyes/open-green.png
  eyes/open-purple.png
  eyes/open-red.png
  eyes/open-white.png
  eyes/open-yellow.png
  eyes/relaxed-blue.png
  eyes/relaxed-gray.png
  eyes/relaxed-green.png
  eyes/relaxed-purple.png
  eyes/relaxed-red.png
  eyes/relaxed-white.png
  eyes/relaxed-yellow.png
  eyes/side-eye-blue.png
  eyes/side-eye-gray.png
  eyes/side-eye-green.png
  eyes/side-eye-purple.png
  eyes/side-eye-red.png
  eyes/side-eye-white.png
  eyes/side-eye-yellow.png

  eyes-epic/adorable-epic.png
  eyes-epic/diamond-epic.png
  eyes-epic/fire-epic.png
  eyes-epic/heart-epic.png
  eyes-epic/moon-epic.png
  eyes-epic/rainbow-epic.png

  eyes-robot/angry-robot.png
  eyes-robot/open-robot.png

  eyes-skeleton/adorable-skeleton.png
  eyes-skeleton/angry-skeleton.png
  eyes-skeleton/discerning-skeleton.png
  eyes-skeleton/fire-skeleton.png
  eyes-skeleton/open-skeleton.png
  eyes-skeleton/relaxed-skeleton.png


  eyes-legendary/closed_(enlightened).png
  eyes-legendary/glitch_1.png
  eyes-legendary/glitch_2.png
  eyes-legendary/glitch_3.png
  eyes-legendary/glitch_4.png
  eyes-legendary/glitch_5.png
  eyes-legendary/glitch_6.png
  eyes-legendary/open_(cosmic).png
  eyes-legendary/open_(enlightened).png
  eyes-legendary/open_(jade).png
  eyes-legendary/relaxed_(enlightened).png
  eyes-legendary/relaxed_(jade).png

  eyes-legendary/angry-golden.png
  eyes-legendary/discerning-golden.png
  eyes-legendary/open-golden.png
  eyes-legendary/relaxed-golden.png
  eyes-legendary/side-eye-golden.png



  eyewear/3d_glasses.png
  eyewear/aviators.png
  eyewear/big_tech.png
  eyewear/black-rimmed_glasses.png
  eyewear/eyepatch.png
  eyewear/gazelles.png
  eyewear/half-moon_spectacles.png
  eyewear/jobs_glasses.png
  eyewear/monocle.png
  eyewear/rose-colored_glasses.png
  eyewear/sunglasses.png
  eyewear/visor.png

  eyewear-legendary/monocle_(jade).png
  eyewear-legendary/visor_(jade).png

  headwear/aviators_cap.png
  headwear/backwards_hat.png
  headwear/bandana.png
  headwear/beanie.png
  headwear/bow.png
  headwear/bucket_hat.png
  headwear/captains_cap.png
  headwear/chromie.png
  headwear/cowboy_hat.png
  headwear/crescent_talisman.png
  headwear/dancing_flame.png
  headwear/diamond.png
  headwear/durag.png
  headwear/fire.png
  headwear/flower.png
  headwear/forest_ranger.png
  headwear/grail.png
  headwear/gremplin.png
  headwear/halo.png
  headwear/headband.png
  headwear/headphones.png
  headwear/heros_cap.png
  headwear/karate_band.png
  headwear/lincoln.png
  headwear/mohawk_(green).png
  headwear/mohawk_(pink).png
  headwear/moon_hat.png
  headwear/pirates_hat.png
  headwear/queens_crown.png
  headwear/raincloud.png
  headwear/rubber_duck.png
  headwear/skully.png
  headwear/space_helmet.png
  headwear/tiara.png
  headwear/tiny_crown.png
  headwear/witchs_hat.png
  headwear/wizards_hat.png

  headwear-legendary/crescent_talisman_(jade).png
  headwear-legendary/dancing_flame_(enlightened).png
  headwear-legendary/dancing_flame_(jade).png
  headwear-legendary/diamond_(jade).png
  headwear-legendary/halo_(enlightened).png
  headwear-legendary/halo_(jade).png
  headwear-legendary/mohawk_(jade).png
  headwear-legendary/parliament_mask_(jade).png
  headwear-legendary/skully_(jade).png
  headwear-legendary/tiny_crown_(enlightened).png
  headwear-legendary/tiny_crown_(jade).png
  headwear-legendary/unicorn_horn_(jade).png
  headwear-legendary/wizards_hat_(jade).png

  outerwear/bomber_jacket.png
  outerwear/diamond_necklace.png
  outerwear/gold_chain.png
  outerwear/heros_tunic.png
  outerwear/hoodie.png
  outerwear/hoodie_down.png
  outerwear/jean_jacket.png
  outerwear/punk_jacket.png
]
puts "  #{paths.size} attribute image path(s)"




ATTRIBUTES = {}

paths.each do |path|

   basename = File.basename( path, File.extname( path ) )

   slug = slugify( basename )
   puts "  #{slug}  => #{path}"

   if ATTRIBUTES.has_key?( slug )
     puts "!! ERROR - duplicate attribute key >#{slug}<:"
     pp rec
     puts "  duplicates/overwrites "
     pp ATTRIBUTES[ slug ]
     exit 1
   end

   ATTRIBUTES[ slug ] = { count: 0,
                          path:  path,
                          image: Image.read( "./moonbirds-official/attributes/#{path}" )
                        }
end


BACKGROUNDS = {
  ## gradients
  'cosmicpurple'      => Image.read( './moonbirds-official/attributes/gradients/cosmic.png' ),
  'enlightenedpurple' => Image.read( './moonbirds-official/attributes/gradients/enlightened.png' ),
  'jadegreen'         => Image.read( './moonbirds-official/attributes/gradients/jade.png' ),
  ## solid colors
  'glitchred'  => Image.new( 42, 42, '#ff0000' ),
  'green'      => Image.new( 42, 42, '#95DBAE' ),
  'pink'       => Image.new( 42, 42, '#FCB6DB' ),
  'purple'     => Image.new( 42, 42, '#ACA3FF' ),
  'yellow'     => Image.new( 42, 42, '#F4CD70' ),
  'blue'       => Image.new( 42, 42, '#9ACEFE' ),
  'gray'       => Image.new( 42, 42, '#CFD4DA' ),
}




## generate all 10 000 moonbirds from text attributes

birds = ImageComposite.new( 100, 100, width: 42,
                                      height: 42)


recs = read_csv( './moonbirds-official/moonbirds.csv')
puts "  #{recs.size} moonbird record(s)"

recs.each_with_index do |rec,i|
  puts "==> #{i}"
  ## pp rec

  bird = Image.new( 42, 42 )

  attributes = [
    "#{rec['body']} - #{rec['feathers']}",
    rec['beak'],
    rec['eyes'],
    rec['eyewear'],
    rec['headwear'],
    rec['outerwear']]
  pp attributes

  attributes.each do |attribute|
    ## note: skip empty strings/attributes (e.g. "")
    next if attribute.empty?

    ## map/convert spec to attribute image keys
    slug = slugify( attribute )
    attr_rec = ATTRIBUTES[ slug ]
    if attr_rec.nil?
      puts "!! ERROR - attribute >#{slug}< not found; sorry"
      pp rec
      exit 1
    end

    bird.compose!( attr_rec[:image] )
    ##  update count stat tracker
    attr_rec[ :count ] += 1
  end

  ## add background
  background = slugify( rec['background'] )
  bird = bird.background( BACKGROUNDS[ background ] )

  ## bird.zoom(8).save( "./tmp2/moonbird#{i}@8x.png")
  birds << bird


  ## break if i > 10
end


birds.save( "./tmp2/moonbirds.png" )


## check for (and report) unused attributes
ATTRIBUTES.each do |slug, rec|
  if rec[:count] == 0
     puts "warn: unused attribute - #{slug} => #{rec[:path]}"
  end
end



puts "bye"



__END__

unused attributes reported:

-- ruby skeleton
warn: unused attribute - longruby => beak/long-ruby.png
warn: unused attribute - shortruby => beak/short-ruby.png

-- legendary jade
warn: unused attribute - shortjade => beak-legendary/short_(jade).png
warn: unused attribute - relaxedjade => eyes-legendary/relaxed_(jade).png
warn: unused attribute - monoclejade => eyewear-legendary/monocle_(jade).png
warn: unused attribute - visorjade => eyewear-legendary/visor_(jade).png
warn: unused attribute - crescenttalismanjade => headwear-legendary/crescent_talisman_(jade).png
warn: unused attribute - dancingflamejade => headwear-legendary/dancing_flame_(jade).png
warn: unused attribute - diamondjade => headwear-legendary/diamond_(jade).png
warn: unused attribute - halojade => headwear-legendary/halo_(jade).png
warn: unused attribute - mohawkjade => headwear-legendary/mohawk_(jade).png
warn: unused attribute - parliamentmaskjade => headwear-legendary/parliament_mask_(jade).png
warn: unused attribute - skullyjade => headwear-legendary/skully_(jade).png
warn: unused attribute - tinycrownjade => headwear-legendary/tiny_crown_(jade).png
warn: unused attribute - unicornhornjade => headwear-legendary/unicorn_horn_(jade).png
warn: unused attribute - wizardshatjade => headwear-legendary/wizards_hat_(jade).png

-- legendary enlightened
warn: unused attribute - relaxedenlightened => eyes-legendary/relaxed_(enlightened).png
warn: unused attribute - dancingflameenlightened => headwear-legendary/dancing_flame_(enlightened).png
warn: unused attribute - haloenlightened => headwear-legendary/halo_(enlightened).png
warn: unused attribute - tinycrownenlightened => headwear-legendary/tiny_crown_(enlightened).png

