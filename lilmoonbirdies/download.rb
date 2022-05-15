#####
# to run use:
#   $ ruby lilmoonbirdies/download.rb


require_relative '../artbase'


c = TokenCollection.new( 'lilmoonbirdies', 10000,
                     token_base: 'ipfs://bafybeieasovflou6ctt6tuj6ixmygqmgxyw6xnmo6tnl4og5e6tl4n4lqa/{id}.json',
                     image_base: 'ipfs://bafybeienm5mhbw5nwracwzufvqwnjqfbmyhs763lft73jcdtz34dhpxf7e/{id}.png',
                     format: '24x24',
                     source: '720x720',
)

## note: starting with index one (1) and NOT zero (0)

# range = (1..100)
# range = (101..10000)

range = (5000..10000)


Artbase.config.ipfs_gateway = 'https://cloudflare-ipfs.com/ipfs/'

retry_on_error( max_tries: 3 ) do
  c.download_meta( range )
end


## todo/fix: add direct:true   flag!!!!
##  add optional ipfs_gateway option - why? why not?
# range = (5744..10000)
# c.download_images( range )

# range = (101..10000)
# c.pixelate( range )


puts "bye"
