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



####
#  add attributes
attributes.each do |rec|
  parts = rec['path'].split( '/')
  ## auto-add  /attributes directory (after first part)
  ##   e.g. moonbirds/headwear/beanie.png =>
  ##        moonbirds/attributes/beanie.png

  path = './' + parts[0] + '/attributes/' + parts[1..-1].join('/')

  spritesheet << Image.read( path )
end

spritesheet.save( "./tmp/spritesheet.png" )
spritesheet.zoom(2).save( "./tmp/spritesheet@2x.png" )


puts "bye"

