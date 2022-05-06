#####
# to run use:
#   $ ruby fastfoodmoonbirds/download.rb


require_relative '../artbase'


##
## contract at polygon
##  - https://polygonscan.com/address/0xbe3226ef4c5177be3535d0890dfb342e1fa24948#code


c = TokenCollection.new( 'fastfoodmoonbirds-ii', 1000,
                     token_base: 'ipfs://QmTreRdqH6w79rmixk2HQVegzH1U4M5D6tn4ibnAUyaCy8/{id}.json',
                     image_base: 'ipfs://QmVFpLud9fUc8pFUtrJ4XKf7gQDiZPThB2kqc1Y7bkbddt/{id}.png',
                     format: '42x42',
                     source: '1008x1008',
)

## note: starting with index one (1) and NOT zero (0)

range = (1..100)
# range = (100..1099)
# c.download_meta( range )

## todo/fix: add direct:true   flag!!!!
##  add optional ipfs_gateway option - why? why not?
# range = (5744..10000)
c.download_images( range )

# range = (101..10000)
# c.pixelate( range )


puts "bye"
