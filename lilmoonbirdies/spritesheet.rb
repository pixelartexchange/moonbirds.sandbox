####################
#  assemble spritesheet (all-in-one composite image with attributes)
#
#  to run use:
#    $ ruby spritesheet.rb


require 'pixelart'


attributes = CsvHash.read( "./attributes.csv" )
puts "  #{attributes.size} record(s)"  #=> 221 record(s)


cols = 20
rows = (attributes.size/cols)
rows +=1   if attributes.size % cols != 0

spritesheet = ImageComposite.new( cols, rows,
                                    width: 24,
                                    height: 24 )


meta = []  ## output meta(data) records


####
#  add attributes
attributes.each do |rec|
  path = rec['path']

  spritesheet << Image.read( "./attributes/#{path}" )

  name       = rec['name']
  more_names = (rec['more_names'] || '').split( '|' )


  if name.nil? || name.empty?
    ## try to auto-fill name for path
    basename   = File.basename(path, File.extname(path))
    dirname    = File.dirname(path)

    basename =  basename.sub( 'body-I-', '' )
    basename =  basename.sub( 'beak-I-', '' )
    basename =  basename.sub( 'eyes-I-', '' )

    name =  basename
  end


  names =  [name] + more_names

  ## normalize spaces in more names
  names = names.map {|str| str.strip.gsub(/[ ]{2,}/, ' ' )}

  meta << [meta.size,
           names[0],
           '?',   ## note: type to done (later)
           names[1..-1].join( ' | '),
          ]
end

spritesheet.save( "./tmp/spritesheet.png" )
spritesheet.zoom(2).save( "./tmp/spritesheet@2x.png" )


headers = ['id', 'name', 'type', 'more_names']
File.open( "./tmp/spritesheet.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end


puts "bye"

