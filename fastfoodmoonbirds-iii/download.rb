#####
# to run use:
#   $ ruby fastfoodmoonbirds-iii/download.rb


require_relative '../artbase'


## - https://fastfoodbirds.xyz
## - https://opensea.io/collection/fastfoodbirds
## - https://twitter.com/fastfoodbirds
## contract at ethereum
## - https://etherscan.io/address/0xebd8d80d5926699f916e0f46574ee209c4cac49c#code



c = TokenCollection.new( 'fastfoodmoonbirds-iii', 5000,
                     token_base: 'ipfs://QmVMSdzQ9evccipos6Jc2UsCrB1uS6ZHr188RBWUGcGtHB/{id}',
                     image_base: 'ipfs://QmXof9jkSZqYrUrt9Pj3S4tq7i3QqwMSW9Whn3i6cZVhUe/{id}.png',
                     format: '42x42',
                     source: '1008x1008',
)


range = (0..99)
# range = (100..3999)

retry_on_error( max_tries: 5 ) do
  c.download_meta( range )
end

## todo/fix: add direct:true   flag!!!!
##  add optional ipfs_gateway option - why? why not?
# range = (5744..10000)


# retry_on_error( max_tries: 5 ) do
#  c.download_images( range )
# end


# range = (101..10000)
# c.pixelate( range )


puts "bye"
