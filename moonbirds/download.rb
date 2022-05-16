#####
# to run use:
#   $ ruby moonbirds/download.rb


require_relative '../artbase'
require_relative 'collection'


c = COLLECTION


# range = (307..999)
range = (3500..9999)
# c.download_meta( range )

##
## ==> 9974 - proof-moonbirds...
## [debug] GET /metadata/9974 uri=https://live---metadata-5covpqijaa-uc.a.run.app/metadata/9974
## !! error: 404 Not Found

# range = (3194..9973)
# c.download_images( range )

# range = (1..9973)
# c.pixelate( range )


# c.dump_attributes


c.export_attributes(
  order: ['Background',
             'Body',
             'Feathers',
             'Beak',
             'Eyes',
             'Eyewear',
             'Headwear',
             'Outerwear']
)



puts "bye"
