##
## contract at polygon
##  - https://polygonscan.com/address/0xbe3226ef4c5177be3535d0890dfb342e1fa24948#code


## note: starting with index one (1) and NOT zero (0)

COLLECTION = TokenCollection.new( 'fastfoodmoonbirds-ii', 1000,
                     token_base: 'ipfs://QmTreRdqH6w79rmixk2HQVegzH1U4M5D6tn4ibnAUyaCy8/{id}.json',
                     image_base: 'ipfs://QmVFpLud9fUc8pFUtrJ4XKf7gQDiZPThB2kqc1Y7bkbddt/{id}.png',
                     format: '42x42',
                     source: '1008x1008',
                     offset: 1
)

