##
# see  https://treasureisland.xyz/
#      https://twitter.com/islandbirds_xyz
#      https://opensea.io/collection/island-birds
#      https://etherscan.io/address/0xf44d6e2df318af47641dbdacff8583ab411dcbdd#code


## only first fifteen available for now (June 22th 2022)
##   (only if minted) check back later

COLLECTION = TokenCollection.new( 'island-birds', 6942,
                     token_base: 'https://birds-app1.herokuapp.com/metadata/{id}',
                     image_base: 'https://storage.googleapis.com/treasure-island-nft/{id}_{id}.png',
                     format: '40x40',
                     source: '800x800',
                     offset: 1
)
