####################
#  assemble spritesheet (all-in-one composite image with attributes)
#
#  to run use:
#    $ ruby spritesheet/spritesheet.rb


require 'pixelart'
require 'csvreader'



attributes = CsvHash.read( "./spritesheet/attributes.csv" )
puts "  #{attributes.size} record(s)"  #=> 82 record(s)


cols = 20
rows = (attributes.size/20)+1
spritesheet = ImageComposite.new( cols, rows, width: 42, height: 42 )


meta = []  ## output meta(data) records


####
#  add attributes
attributes.each do |rec|
  parts = rec['path'].split( '/')
  ## auto-add  /attributes directory (after first part)
  ##   e.g. moonbirds/headwear/beanie.png =>
  ##        moonbirds/attributes/beanie.png

  path = './' + parts[0] + '/attributes/' + parts[1..-1].join('/')
  spritesheet << Image.read( path )



  name       = rec['name']
  more_names = (rec['more_names'] || '').split( '|' )


  if name.nil? || name.empty?
    ## try to auto-fill name for path
    filename   = parts[-1]
    basename   = File.basename(filename, File.extname(filename))
    dirname    = parts[-2]
    collection = parts[0]

    name =   if dirname == 'body' || dirname == 'body_legendary'
                more_names << basename   ## bonus - add shortcut to more_names too
                "body #{basename}"
             elsif dirname == 'beak'
                more_names << basename   ## bonus - add shortcut to more_names too
                "beak #{basename}"
             elsif dirname == 'eyes' && collection == 'moonbirds'
                more_names << basename   ## bonus - add shortcut to more_names too
                "eyes #{basename}"
             else
                basename
             end
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

