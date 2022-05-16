#####
# to run use:
#   $ ruby fastfoodmoonbirds-iii/download_ii.rb


require_relative '../artbase'
require_relative 'collection'


c = COLLECTION

# range = (0..99)


Artbase.config.ipfs_gateway = 'https://cloudflare-ipfs.com/ipfs/'
range = (2000..3999)

retry_on_error( max_tries: 8 ) do
  c.download_meta( range )
end



puts "bye"


