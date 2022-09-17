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


  bird.zoom(8).save( "./tmp2/moonbird#{i}@8x.png")

  ## break if i > 10
end



## check for (and report) unused attributes
ATTRIBUTES.each do |slug, rec|
  if rec[:count] == 0
     puts "warn: unused attribute - #{slug} => #{rec[:path]}"
  end
end



puts "bye"