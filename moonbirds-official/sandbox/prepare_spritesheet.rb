require 'pixelart'


###
#  add gradient background to legendary
#      enlightened/cosmic/jade

attributes_dir = './moonbirds-official/attributes'

COSMIC      = Image.read( "#{attributes_dir}/gradients/cosmic.png" )
ENLIGHTENED = Image.read( "#{attributes_dir}/gradients/enlightened.png" )
JADE        = Image.read( "#{attributes_dir}/gradients/jade.png" )


bodies = %w[
  cosmic-legendary_brave
  cosmic-legendary_crescent
  cosmic-legendary_emperor
  cosmic-legendary_guardian
  cosmic-legendary_professor
  cosmic-legendary_sage

  enlightened-legendary_brave
  enlightened-legendary_crescent
  enlightened-legendary_emperor
  enlightened-legendary_guardian
  enlightened-legendary_professor
  enlightened-legendary_sage

  jade-legendary_brave
  jade-legendary_crescent
  jade-legendary_emperor
  jade-legendary_guardian
  jade-legendary_professor
  jade-legendary_sage
]

pp bodies

bodies.each do |body|
  body_legendary = Image.read( "#{attributes_dir}/body-legendary/#{body}.png" )

  background = if body.start_with?( 'cosmic' )
                    COSMIC
               elsif body.start_with?( 'enlightened' )
                    ENLIGHTENED
               else  ## assume jade for now ;-)
                    JADE
               end

  img = Image.new( 42, 42 )
  img.compose!( background )
  img.compose!( body_legendary )

  img.save( "#{attributes_dir}/body-legendary_w_gradients/#{body}.png" )
  ## img.zoom(8).save( "./tmp3/#{body}@8x.png" )
end


puts "bye"


