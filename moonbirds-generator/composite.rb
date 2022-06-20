require 'pixelart'


body_names = %w[
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

body_colors = %w[
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

## 9x9 composite of all body types (9) & colors (9)
birds = ImageComposite.new( body_names.size,
                            body_colors.size,
                            width: 42,
                            height: 42 )

body_colors.each do |color|
  body_names.each do |name|
      bird = Image.read( "../moonbirds/attributes/body_i/#{name}-#{color}.png" )
      birds << bird
  end
end

birds.save( "./tmp/bodies.png" )
birds.zoom(2).save( "./tmp/bodies@2x.png" )




eye_names = %w[
  angry
  discerning
  focused
  open
  relaxed
  side-eye
]

eye_colors = %w[
  gray
  blue
  yellow
  green
  purple
  red
  white
]

## 6x7 composite of all eye types (6) & colors (7)
birds = ImageComposite.new( eye_names.size,
                            eye_colors.size,
                            width: 42,
                            height: 42 )

eye_colors.each do |color|
  eye_names.each do |name|
      bird = Image.read( "../moonbirds/attributes/eyes_i/#{name}-#{color}.png" )
      birds << bird
  end
end

birds.save( "./tmp/eyes.png" )
birds.zoom(2).save( "./tmp/eyes@2x.png" )


puts "bye"

