#####
# to run use:
#   $ ruby fastfoodmoonbirds-iii/download.rb


require_relative '../artbase'


## https://opensea.io/collection/fast-food-moonbirds
## contract at ethereum
##  - https://etherscan.io/address/0xf837d4560683f6e243c743fadf429d64efdb810b#readContract
##
##   "rugpulled" ?? e.g. collection no longer active
##                         and incomplete (e.g. legendary "Quit" with blank images on purpose?)??


c = TokenCollection.new( 'fastfoodmoonbirds-iii', 4000,
                     # https://ipfs.io/ipfs/QmQAvLLz6HoRJL5nMUt1hi5EeKomqpP9aSsYTm7MgHjGcX/0
                     token_base: 'ipfs://QmQAvLLz6HoRJL5nMUt1hi5EeKomqpP9aSsYTm7MgHjGcX/{id}',
                     image_base: 'ipfs://QmSfQsQGQKVGt4Rye74Vgc7zTeGUgTEGEkmxZTu5wXj6vp/{id}.png',
                     ## note: quick & dirty hack - find a "better" config option - why? why not?
                     image_base_id_format: '%04d',  ## e.g 0000,0001,0002,etc. !!
                     format: '42x42',   ## note: 12px overflow(!!) + 42*14px (588) = 600px
                     source: '600x600',
)


# range = (0..99)
# range = (100..3999)
range = (2900..3999)

# retry_on_error( max_tries: 5 ) do
#  c.download_meta( range )
# end

## todo/fix: add direct:true   flag!!!!
##  add optional ipfs_gateway option - why? why not?
# range = (5744..10000)




retry_on_error( max_tries: 5 ) do
  c.download_images( range )
end


# range = (101..10000)
# c.pixelate( range )


puts "bye"


__END__

## try to fix - some "blank" images - possible??
##   is Legendary / Quit  on purpose blank as a "rugpull" joke??


## - 516 - double checked image again via metadata - is blank again
{"name": "#516",
  "image": "ipfs://QmSfQsQGQKVGt4Rye74Vgc7zTeGUgTEGEkmxZTu5wXj6vp/0516.png",
  "attributes":
  [{"trait_type": "Background", "value": "Golden Arches Yellow"},
    {"trait_type": "Body", "value": "Crescent"},
    {"trait_type": "Eyes", "value": "Side Eye"},
    {"trait_type": "Beak", "value": "Long"},
    {"trait_type": "Legendary", "value": "Quit"}]}

## - 683 - double checked image again via metadata - is blank again
{"name": "#683",
 "image": "ipfs://QmSfQsQGQKVGt4Rye74Vgc7zTeGUgTEGEkmxZTu5wXj6vp/0683.png",
 "attributes":
 [{"trait_type": "Background", "value": "America Runs On Orange"},
  {"trait_type": "Body", "value": "Crescent"},
  {"trait_type": "Eyes", "value": "Side Eye"},
  {"trait_type": "Beak", "value": "Short"},
  {"trait_type": "Legendary", "value": "Quit"}]}
