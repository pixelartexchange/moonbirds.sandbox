#####
# to run use:
#   $ ruby fastfoodmoonbirds/attributes.rb


require_relative '../artbase'
require_relative 'collection'


c = COLLECTION

# c.dump_attributes


c.export_attributes(
  order: ['Background',
          'Body',
          'Feathers',
          'Beak',
          'Eyes',
          'Eyewear',
          'Headwear',
          'Outfit',]
)

puts "bye"

