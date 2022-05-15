#####
# to run use:
#   $ ruby fastfoodmoonbirds/download.rb


require_relative '../artbase'
require_relative 'collection'


c = COLLECTION


# range = (0..99)
range = (100..4999)

retry_on_error( max_tries: 5 ) do
  c.download_meta( range )
end

## todo/fix: add direct:true   flag!!!!
##  add optional ipfs_gateway option - why? why not?

# retry_on_error( max_tries: 5 ) do
#  c.download_images( range )
# end


# range = (100..999)
# c.pixelate( range )


puts "bye"


