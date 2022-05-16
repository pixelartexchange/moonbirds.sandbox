#####
# to run use:
#   $ ruby lilmoonbirdies/download.rb

require_relative '../artbase'
require_relative 'collection'


c = COLLECTION



## note: starting with index one (1) and NOT zero (0)

# range = (1..100)
range = (101..10000)
range = (101..5000)


# range = (5000..10000)
# Artbase.config.ipfs_gateway = 'https://cloudflare-ipfs.com/ipfs/'

retry_on_error( max_tries: 8 ) do
  c.download_meta( range )
end


## todo/fix: add direct:true   flag!!!!
##  add optional ipfs_gateway option - why? why not?
# range = (5744..10000)
# c.download_images( range )

# range = (101..10000)
# c.pixelate( range )


puts "bye"
