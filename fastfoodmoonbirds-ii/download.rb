#####
# to run use:
#   $ ruby fastfoodmoonbirds-ii/download.rb


require_relative '../artbase'
require_relative 'collection'


c = COLLECTION


## note: starting with index one (1) and NOT zero (0)

# range = (1..100)
range = (101..1000)
retry_on_error( max_tries: 5 ) do
  c.download_meta( range )
end

## todo/fix: add direct:true   flag!!!!
##  add optional ipfs_gateway option - why? why not?
# range = (5744..10000)
# retry_on_error( max_tries: 5 ) do
#   c.download_images( range )
# end

# range = (101..10000)
# c.pixelate( range )


puts "bye"
