require 'pixelart'



## 9x9 composite of all body types (9) & colors (9)

names = %w[
  brave
  crescent
  emperor
  guardian
  professor
  sage
  stark
  tabby
  tranquil
]

colors = %w[
  black
  blue
  brown
  gray
  green
  pink
  purple
  red
  white
]


birds = ImageComposite.new( 9, 9, width: 42,
                                  height: 42 )

colors.each do |color|
  names.each do |name|
      bird = Image.read( "../moonbirds/attributes/body_i/#{name}-#{color}.png" )
      birds << bird
  end
end


birds.save( "./tmp/bodies.png" )
birds.zoom(2).save( "./tmp/bodies@2x.png" )


puts "bye"

