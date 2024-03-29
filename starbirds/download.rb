#####
# to run use:
#   $ ruby starbirds/download.rb


require_relative '../artbase'
require_relative 'collection'


c = COLLECTION




# range = (0..99)
# range = (752..2999)
# c.download_meta( range )


# range = (1248..2999)
# c.download_images( range )


###
#  note:
##   special cases - #961  is 420x420 (NOT 1000x1000)
##                   #1073 is 420x420 (NOT 1000x1000)
#                    #1842 is 420x420 (NOT 1000x1000)
#                    #2582 is 420x420 (NOT 1000x1000)

# range = (100..999)
# range = (2583..2999)
# c.pixelate( range )


# range = (0..2999)
# c.dump_attributes

c.export_attributes(
  order: ['Background',
          'Base',
          'Eyes',
          'Head',
          'Clothes',
          'Name' ],
  renames: { 'Name' => 'Name 1/1'}   ## use Special Edition (Name) or such - why? why not?
)



puts "bye"
