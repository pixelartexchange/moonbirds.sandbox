####
#  auto-generate (attribute) names by color
#    for body & eyes

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

body_colors.each do |color|
  body_names.each do |name|
      puts "moonbirds/body/#{name}-#{color}.png, #{name} #{color}, #{color} #{name}"
  end
  puts
end



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

eye_colors.each do |color|
  eye_names.each do |name|
    puts "moonbirds/eyes_i/#{name}-#{color}.png, #{name} #{color}, #{color} #{name}"
  end
  puts
end



puts "bye"
