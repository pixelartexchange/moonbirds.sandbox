require 'pixelart'


BLUE_COLOR1  = '#122b61'  # hsl(221°  69%  23%)
BLUE_COLOR2  = '#2f5392'  # hsl(218°  51%  38%)
BLUE_COLOR3  = '#4377d2'  # hsl(218°  61%  54%)
BLUE_COLOR4  = '#57c1ff'  # hsl(202° 100%  67%)

RED_COLOR1  = '#591312'
RED_COLOR2  = '#9D2E33'
RED_COLOR3  = '#E14249'
RED_COLOR4  = '#F89A77'

PURPLE_COLOR1 = '#2D1066'
PURPLE_COLOR2 = '#604792'
PURPLE_COLOR3 = '#8965D2'
PURPLE_COLOR4 = '#DC9EFF'

GREEN_COLOR1 = '#1C4D29'
GREEN_COLOR2 = '#2B7D4A'
GREEN_COLOR3 = '#3DB36A'
GREEN_COLOR4 = '#63E278'

YELLOW_COLOR1 = '#85430A'
YELLOW_COLOR2 = '#B07027'
YELLOW_COLOR3 = '#FDA037'
YELLOW_COLOR4 = '#FFD970'

WHITE_COLOR1 = '#6A6C75'
WHITE_COLOR2 = '#8E9297'
WHITE_COLOR3 = '#CCD2D9'
WHITE_COLOR4 = '#FFFFFF'   # white

GRAY_COLOR1  = '#171B1F'
GRAY_COLOR2  = '#45484B'
GRAY_COLOR3  = '#63676B'
GRAY_COLOR4  = '#828A8F'




eye_colors = {
  'blue'   => [BLUE_COLOR1,BLUE_COLOR2,BLUE_COLOR3,BLUE_COLOR4],
  'red'    => [RED_COLOR1,RED_COLOR2,RED_COLOR3,RED_COLOR4],
  'purple' => [PURPLE_COLOR1,PURPLE_COLOR2,PURPLE_COLOR3,PURPLE_COLOR4],
  'green'  => [GREEN_COLOR1,GREEN_COLOR2,GREEN_COLOR3,GREEN_COLOR4],
  'yellow' => [YELLOW_COLOR1,YELLOW_COLOR2,YELLOW_COLOR3,YELLOW_COLOR4],
  'white'  => [WHITE_COLOR1,WHITE_COLOR2,WHITE_COLOR3,WHITE_COLOR4],
  'gray'   => [GRAY_COLOR1,GRAY_COLOR2,GRAY_COLOR3,GRAY_COLOR4],
}

pp eye_colors

names = %w[
  angry
  discerning
  focused
  open
  relaxed
  side-eye
]

color_names = eye_colors.keys[1..-1]   ## cut-off first entry blue

BLUE_COLORS = eye_colors['blue']

names.each do |name|
  ## note: use blue as a base as gray/black uses black as a color AND for outlines
  base = Image.read( "./attributes/eyes_i/#{name}-blue.png")
  puts "==>  #{name} colors:"

  color_names.each do |color_name|
    colors = eye_colors[ color_name ]
    color_map = {}

    BLUE_COLORS.each_with_index do |hex,i|
        color_map[ hex ] = colors[i]
    end
    baseii = base.change_colors( color_map )
    baseii.save( "./tmp3/#{name}-#{color_name}.png" )
    baseii.zoom(4).save( "./tmp/#{name}-#{color_name}@4x.png" )
  end

end



