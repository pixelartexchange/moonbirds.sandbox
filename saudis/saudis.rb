require 'moonbirds'



RED_SHEMAGH   = Image.read( './red_shemagh_agal.png' )
WHITE_SHEMAGH = Image.read( './white_shemagh_agal.png' )


specs = Csv.parse( <<TXT )
 White Crescent , Small Orange, Angry Yellow
 Golden Crescent , Small Golden, Open Golden
 Pink Crescent , Small Gray, Moon

 Ruby Skeleton,  Small Ruby,     Relaxed Ruby
 Skeleton,       Long Skeleton,  Visor
 Black Crescent, Small Orange,   Hearts
TXT

pp specs


saudis = ImageComposite.new( 3, 2, width: 42,
                                   height: 42,
                                   background: '#006C35'  )

specs.each_with_index do |attributes,i|
   saudi = Moonbird::Image.generate( *attributes )

   saudi.compose!( i < 3 ? RED_SHEMAGH : WHITE_SHEMAGH )
   saudi.save( "./tmp/saudi#{i}.png" )
   saudi.zoom(8).save( "./tmp/saudi#{i}@8x.png" )

   saudis << saudi
end

saudis.save( "./tmp/saudis.png" )
saudis.zoom(4).save( "./tmp/saudis@4x.png" )


puts "bye"