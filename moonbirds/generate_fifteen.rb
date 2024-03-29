#####
# to run use:
#   $ ruby moonbirds/generate_fifteen.rb
#
#
#  generate fifteen new never-before-seen variants
#   for the top seller #7963
#    - background:        Jade Green
#    - feathers (color):  Jade
#    - body (type):       Legendary Emperor
#

require 'pixelart'




base = Image.read( './moonbirds/42x42/7963.png' )

moonbirds = ImageComposite.new( 5, 3, width: 42, height: 42 )

['eyewear/3d_glasses',
 'eyewear/eyepatch',
 'eyewear/gazelles',
 'eyewear/jobs_glasses',
 'eyewear/rose-colored_glasses',
 'eyewear/sunglasses',
 'eyewear/visor',
 'headwear/bow',
 'headwear/cowboy_hat',
 'headwear/flowers',
 'headwear/lincoln',
 'headwear/moon_hat',
 'outerwear/hoodie',
 'outerwear/hoodie_down',
 'outerwear/punk_jacket',
].each do |attribute|
  moonbird = Image.new( 42, 42 )
  moonbird.compose!( base )
  moonbird.compose!( Image.read( "./moonbirds/attributes/#{attribute}.png" ))

  moonbirds << moonbird
end


moonbirds.save( "./tmp/moonbirds-jade_green.png" )
moonbirds.zoom(4).save( "./tmp/moonbirds-jade_green@4x.png" )



#####
#  try new #1 top seller  with more "starbirds" attributes
#    Moonbirds #2642 – 350 ETH (~$1,030,000)
#    -  background:      Jade Green
#    -  feathers (color) Jade
#    -  body (type):     Legendary Sage

base = Image.read( './moonbirds/42x42/2642.png' )

moonbirds = ImageComposite.new( 5, 3, width: 42, height: 42 )

[
  ['eyes/round_glasses', [1,0]],
  ['eyes/red_shades', [1,1]],
  ['eyes/rainbow_shades', [1,0]],
  ['eyes/green_shades', [0,2] ],
  ['eyes/aviators', [0,1]],
  ['eyes/neon_shades', [1,1]],
  ['eyes/vipers', [1,1]],
  ['head/gold', [1,0]],
  ['head/crown', [1,0]],
  ['head/red_bucket', [1,0]],
  ['head/cowboy', [1,1]],
  ['head/black_red'],
  ['clothes/blue_hoodie'],
  ['clothes/blue_scarf'],
  ['clothes/blue_shirt'],
].each do |rec|

  attribute_name   = rec[0]
  attribute_offset = rec[1]

  moonbird = Image.new( 42, 42 )
  moonbird.compose!( base )

  attribute = Image.read( "./starbirds/attributes/#{attribute_name}.png" )

  ##  quick & dirty hack:
  ## cut-off px on left  for now
  ## add px on top for now by cut-off px from bottom for now
  if attribute_offset
    attribute = attribute.crop( attribute_offset[0], 0,
                                42-attribute_offset[0],
                                42-attribute_offset[1] )
    moonbird.compose!( attribute, 0, attribute_offset[1] )
  else
    moonbird.compose!( attribute )
  end


  moonbirds << moonbird
end


moonbirds.save( "./tmp/moonbirds-jade_green-ii.png" )
moonbirds.zoom(4).save( "./tmp/moonbirds-jade_green-ii@4x.png" )



#####
#  try new #2 top seller with fastfood attributes
#    Moonbirds #3904
#    -  background:      Enlightened Purple
#    -  feathers (color) Enlightened
#    -  body (type):     Legendary Crescent

base = Image.read( './moonbirds/42x42/3904.png' )


moonbirds = ImageComposite.new( 5, 3, width: 42, height: 42 )

[
  'headwear/macdonalds-red',
  'headwear/macdonalds-black',
  'headwear/macdonalds-white',
  'headwear/wendys',
  'headwear/burger_king',
  'headwear/chef-white',
  'headwear/chef-red',
  'headwear/dunkin_donuts',
  'headwear/white_castle',
  'headwear/pizzahut',
  'headwear/dominos_pizza',
  'headwear/subway',
  'headwear/burger',
  'headwear/fries',
  'headwear/cola',
].each do |attribute|

  moonbird = Image.new( 42, 42 )
  moonbird.compose!( base )
  moonbird.compose!( Image.read( "./fastfoodmoonbirds-ii/attributes/#{attribute}.png" ))

  moonbirds << moonbird
end


moonbirds.save( "./tmp/moonbirds-enlightened_purple.png" )
moonbirds.zoom(4).save( "./tmp/moonbirds-enlightened_purple@4x.png" )



### try some more fast food attributes

moonbirds = ImageComposite.new( 5, 3, width: 42, height: 42 )

[
  'headwear/mcdonalds_hat',
  'headwear/mcdonalds_visor',
  'headwear/mcdonalds_bucket_hat',
  'headwear/in-n-out_burger_hat',
  'headwear/dominos_hat',
  'headwear/dunkin_donuts_hat',
  'headwear/hooters_hat',
  'headwear/ice_cream_cone',
  'headwear/kfc_bucket_hat',
  'headwear/popcorn',
  'headwear/subway_visor_2',
  'headwear/taco_bell_hat',
  'headwear/walmart_hat',
  'headwear/walmart_hat_2',
  'headwear/ben-n-jerrys_bucket_hat',
].each do |attribute|

  moonbird = Image.new( 42, 42 )
  moonbird.compose!( base )
  moonbird.compose!( Image.read( "./fastfoodmoonbirds/attributes/#{attribute}.png" ))

  moonbirds << moonbird
end


moonbirds.save( "./tmp/moonbirds-enlightened_purple-ii.png" )
moonbirds.zoom(4).save( "./tmp/moonbirds-enlightened_purple-ii@4x.png" )


### try some more fast food attributes

moonbirds = ImageComposite.new( 5, 3, width: 42, height: 42 )

[ 'fastfoodmoonbirds/attributes/outfit/el_pollo_loco_mascot',
  'fastfoodmoonbirds-ii/attributes/headwear/chicken',
  'fastfoodmoonbirds-iii/attributes/headwear/kfc_family_bucket',
  'fastfoodmoonbirds-iii/attributes/headwear/mcdonalds-red',
  'fastfoodmoonbirds-iii/attributes/headwear/in-n-out',
  'fastfoodmoonbirds-iii/attributes/headwear/burger_kings_crown',
  'fastfoodmoonbirds/attributes/headwear/pizza_hut_hat',
  'fastfoodmoonbirds-iii/attributes/headwear/grill_cook',
  'fastfoodmoonbirds-iii/attributes/outerwear/hibachi',
  'fastfoodmoonbirds-iii/attributes/outerwear/kfc_shirt',
  'fastfoodmoonbirds-iii/attributes/outerwear/manager',
  'fastfoodmoonbirds-iii/attributes/outerwear/mcdonalds',
  'fastfoodmoonbirds-iii/attributes/outerwear/mcdonalds_classic',
  'fastfoodmoonbirds-iii/attributes/outerwear/mcdonalds_old_skool',
  'fastfoodmoonbirds-iii/attributes/accessory/drive-thru-on-duty',
 ].each do |attribute|

  moonbird = Image.new( 42, 42 )
  moonbird.compose!( base )
  moonbird.compose!( Image.read( "./#{attribute}.png" ))

  moonbirds << moonbird
end


moonbirds.save( "./tmp/moonbirds-enlightened_purple-iii.png" )
moonbirds.zoom(4).save( "./tmp/moonbirds-enlightened_purple-iii@4x.png" )


puts "bye"


