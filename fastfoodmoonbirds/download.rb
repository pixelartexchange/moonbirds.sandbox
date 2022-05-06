#####
# to run use:
#   $ ruby fastfoodmoonbirds/download.rb


require_relative '../artbase'


## https://opensea.io/collection/fast-food-moonbirds
## contract at ethereum
##  - https://etherscan.io/address/0xf837d4560683f6e243c743fadf429d64efdb810b#readContract

c = TokenCollection.new( 'fastfoodmoonbirds', 4000,
                     # https://ipfs.io/ipfs/QmQAvLLz6HoRJL5nMUt1hi5EeKomqpP9aSsYTm7MgHjGcX/0
                     token_base: 'ipfs://QmQAvLLz6HoRJL5nMUt1hi5EeKomqpP9aSsYTm7MgHjGcX/{id}',
                     image_base: 'ipfs://QmSfQsQGQKVGt4Rye74Vgc7zTeGUgTEGEkmxZTu5wXj6vp/{id}.png',
                     ## note: quick & dirty hack - find a "better" config option - why? why not?
                     image_base_id_format: '%04d',  ## e.g 0000,0001,0002,etc. !!
                     format: '42x42',   ## note: 12px overflow(!!) + 42*14px (588) = 600px
                     source: '600x600',
)


range = (0..99)
# range = (100..1099)
# c.download_meta( range )

## todo/fix: add direct:true   flag!!!!
##  add optional ipfs_gateway option - why? why not?
# range = (5744..10000)
# c.download_images( range )

# range = (101..10000)
c.pixelate( range )


puts "bye"
