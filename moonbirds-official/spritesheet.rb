####################
#  assemble spritesheet (all-in-one composite image with attributes)

require 'spritesheet'


sheet = Spritesheet.pack( "./attributes.csv",
                          dir: "./attributes",
                          cols: 20,
                          width: 42,
                          height: 42 )

sheet.image.save( "./tmp/spritesheet_v1-42x42.png" )
sheet.image.zoom(2).save( "./tmp/spritesheet_v1-42x42@2x.png" )

sheet.export( "./tmp/spritesheet_v1-42x42.csv" )


puts "bye"
