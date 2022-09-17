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

recs = read_csv( "./moonbirds-official/attributes.csv" )
puts "  #{recs.size} attribute record(s)"

ATTRIBUTES = {}

recs.each do |rec|
   path = rec['path']
   name = rec['name']

   if name.nil?
     basename = File.basename( path, File.extname( path ) )
     name = basename
   end

   slug = slugify( name )
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

warn: unused attribute - longruby => beak/long-ruby.png
warn: unused attribute - shortruby => beak/short-ruby.png
warn: unused attribute - shortjade => beak/short_(jade).png
warn: unused attribute - adorableruby => eyes/adorable-ruby.png
warn: unused attribute - angryruby => eyes/angry-ruby.png
warn: unused attribute - fireruby => eyes/fire-ruby.png
warn: unused attribute - openadorable => eyes/open-adorable.png
warn: unused attribute - opendiamond => eyes/open-diamond.png
warn: unused attribute - openenchanted => eyes/open-enchanted.png
warn: unused attribute - openfire => eyes/open-fire.png
warn: unused attribute - openmoon => eyes/open-moon.png
warn: unused attribute - openrainbow => eyes/open-rainbow.png
warn: unused attribute - openruby => eyes/open-ruby.png
warn: unused attribute - relaxedruby => eyes/relaxed-ruby.png
warn: unused attribute - relaxedenlightened => eyes-legendary/relaxed_(enlightened).png
warn: unused attribute - relaxedjade => eyes-legendary/relaxed_(jade).png
warn: unused attribute - monoclejade => eyewear-legendary/monocle_(jade).png
warn: unused attribute - visorjade => eyewear-legendary/visor_(jade).png
warn: unused attribute - crescenttalismanjade => headwear-legendary/crescent_talisman_(jade).png
warn: unused attribute - dancingflameenlightened => headwear-legendary/dancing_flame_(enlightened).png
warn: unused attribute - dancingflamejade => headwear-legendary/dancing_flame_(jade).png
warn: unused attribute - diamondjade => headwear-legendary/diamond_(jade).png
warn: unused attribute - haloenlightened => headwear-legendary/halo_(enlightened).png
warn: unused attribute - halojade => headwear-legendary/halo_(jade).png
warn: unused attribute - mohawkjade => headwear-legendary/mohawk_(jade).png
warn: unused attribute - parliamentmaskjade => headwear-legendary/parliament_mask_(jade).png
warn: unused attribute - skullyjade => headwear-legendary/skully_(jade).png
warn: unused attribute - tinycrownenlightened => headwear-legendary/tiny_crown_(enlightened).png
warn: unused attribute - tinycrownjade => headwear-legendary/tiny_crown_(jade).png
warn: unused attribute - unicornhornjade => headwear-legendary/unicorn_horn_(jade).png
warn: unused attribute - wizardshatjade => headwear-legendary/wizards_hat_(jade).png