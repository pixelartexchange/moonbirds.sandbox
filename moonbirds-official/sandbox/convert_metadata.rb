#####
# to run use:
#   $ ruby moonbirds-official/sandbox/convert_metadata.rb
#
#
#   convert traits.json
#    to "flat-file" tabular comma-separated values (csv) file
#
#  download the all-in-one traits.json dataset (~2MB)
#    here https://github.com/proofxyz/moonbirds-assets



require 'cocos'





def convert_traits( data )
  required_keys = [
    "Body",
    "Feathers",
    "Background",
    ]
  optional_keys = [
    "Specie",
    "Beak",   # note: glitch has no beak (only eyes)
    "Eyes",      # note: might be eyes or eyewar!!
    "Eyewear",
    "Headwear",
    "Outerwear",
  ]

  keys = required_keys + optional_keys

  traits = {}

  ## todo: check for None

  data.each do |key,value|
    trait_type  = key.strip
    trait_value = value.strip

    next if trait_value == 'None'  ## note: skip none if not present

    unless keys.include?( trait_type )
      puts "!! ERROR - unknown trait_type #{trait_type} in:"
      pp data
      exit 1
    end

    if traits.has_key?( trait_type )  # check for duplicates
      puts "!! ERROR - duplicate trait_type #{trait_type} in:"
      pp data
      exit 1
    end
    traits[trait_type] = trait_value
  end


  required_keys.each do |key|
    unless traits.has_key?( key )
      puts "!! ERROR - required trait_type #{key} missing in :"
      pp data
      exit 1
    end
  end

  traits
end


data = read_json( './moonbirds-official/traits.json' )
puts " #{data.size} record(s)"




recs = []

data.each_with_index do |h,i|
  traits = convert_traits( h )

 ##
 ## quick fixes for metadata:
 ##  if  body = Skeleton | Ruby Skeleton
 ##   change eyes  Adorable - Epic  to   Adorable - Skeleton !!!
 ##                Fire - Epic      to   Fire - Skeleton !!!

  if ['Skeleton', 'Ruby Skeleton'].include?( traits['Body'] )
     if traits['Eyes']
       traits['Eyes'] = 'Adorable - Skeleton'  if traits['Eyes'] == 'Adorable - Epic'
       traits['Eyes'] = 'Fire - Skeleton'      if traits['Eyes'] == 'Fire - Epic'

       ## check that eyes include always skeleton qualifier!
       if traits['Eyes'].index( 'Skeleton').nil?
          puts "!! ERROR - (ruby) sekeleton moonbird eyes without skeleton qualifier!!:"
          pp traits
          exit 1
       end
     end
  end


  recs << [
    i.to_s,
    traits['Specie'],
    traits['Body'],
    traits['Feathers'],
    traits['Beak'],
    traits['Eyes'],
    traits['Eyewear'],
    traits['Headwear'],
    traits['Outerwear'],
    traits['Background'],
  ]
end


pp recs[0..999]



puts
headers = [ 'id',
            'specie',
            'body',
            'feathers',
            'beak',
            'eyes',
            'eyewear',
            'headwear',
            'outerwear',
            'background',
]


### save to official.csv

File.open( './tmp/moonbirds.csv', 'w:utf-8') do |f|
   f.write( headers.join( ', ' ))
   f.write( "\n" )
   recs.each do |rec|
     f.write( rec.join( ', ' ))
     f.write( "\n" )
  end
end

puts "bye"