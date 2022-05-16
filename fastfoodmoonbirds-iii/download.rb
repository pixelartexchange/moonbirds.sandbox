#####
# to run use:
#   $ ruby fastfoodmoonbirds-iii/download.rb


require_relative '../artbase'
require_relative 'collection'


c = COLLECTION

# range = (0..99)
range = (0..3999)
# range = (999..3999)
# range = (2900..3999)


# Artbase.config.ipfs_gateway = 'https://cloudflare-ipfs.com/ipfs/'
range = (1497..3999)

retry_on_error( max_tries: 8 ) do
  c.download_meta( range )
end

## todo/fix: add direct:true   flag!!!!
##  add optional ipfs_gateway option - why? why not?
# range = (5744..10000)


#
# range = (3860..3999)
# range = (2000..3999)

# retry_on_error( max_tries: 5 ) do
#  c.download_images( range )
# end


# range = (101..10000)
# c.pixelate( range )


puts "bye"


