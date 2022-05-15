#####
# to run use:
#   $ ruby fastfoodmoonbirds-ii/attributes.rb


require_relative '../artbase'
require_relative 'collection'


c = COLLECTION

# c.dump_attributes


c.export_attributes(
  order: ['Background',
          'Tribe',
          'Eyewear',
          'Headwear',
          'Outerwear',
          'Cosmic',
          'Enlightened',
          'Glitch',
          'Jade']
)


puts "bye"

