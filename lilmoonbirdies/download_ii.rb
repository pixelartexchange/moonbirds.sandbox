#####
# to run use:
#   $ ruby lilmoonbirdies/download_ii.rb

require_relative '../artbase'
require_relative 'collection'


c = COLLECTION



## note: starting with index one (1) and NOT zero (0)

###
# try with different ipfs gateway
Artbase.config.ipfs_gateway = 'https://cloudflare-ipfs.com/ipfs/'


range = (6000..10000)

retry_on_error( max_tries: 3 ) do
  c.download_meta( range )
end


puts "bye"
