require 'pixelart'

WHITE_ISH  = '#ebe4da'   #  hsl( 35°  30%  89%)
WHITE_ISH2 = '#f5efe6'   #  hsl( 36°  43%  93%)
GRAY_ISH_LIGHT = '#a4a099'  # hsl( 38°   6%  62%)
GRAY_ISH_DARK  = '#4d4843'  # hsl( 30°   7%  28%)


BLUE_COLOR1 = '#122b61'  #  hsl(221°  69%  23%)  -- darkest
BLUE_COLOR2 = '#2f5393'  #  hsl(218°  52%  38%)
BLUE_COLOR3 = '#4377d2'  #  hsl(218°  61%  54%)
BLUE_COLOR4 = '#3965b3'  #  hsl(218°  52%  46%)
BLUE_COLOR5 = '#52a4ff'  #  hsl(212° 100%  66%)
BLUE_COLOR6 = '#57c1ff'  #  hsl(202° 100%  67%)

RED_COLOR1 = '#591312'   # hsl(  1°  66%  21%)  - #1
RED_COLOR2 = '#9e2e33'   # hsl(357°  55%  40%)  - #2
RED_COLOR3 = '#e14249'   # hsl(357°  73%  57%)  - #3
RED_COLOR4 = '#BF383E'
RED_COLOR5 = '#f5676c'   # hsl(358°  88%  68%)  - #5
RED_COLOR6 = '#f89a77'   # hsl( 16°  90%  72%)  - #6

PURPLE_COLOR1 = '#2d1066'   # hsl(260°  73%  23%)   - #1
PURPLE_COLOR2 = '#604793'   # hsl(260°  35%  43%)   - #2
PURPLE_COLOR3 = '#8965d2'   # hsl(260°  55%  61%)   - #3
PURPLE_COLOR4 = '#7456B3'
PURPLE_COLOR5 = '#ba8cfa'  # hsl(265°  92%  76%)    -#5
PURPLE_COLOR6 = '#dc9eff'   # hsl(278° 100%  81%)   - #6

BLACK_COLOR1 = '#000000'    # hsl(  0°   0%   0%)
BLACK_COLOR2 = '#24282d'    # hsl(213°  11%  16%)
BLACK_COLOR3 = '#333940'    # hsl(212°  11%  23%)
BLACK_COLOR4 = '#2B3036'
BLACK_COLOR5 = '#63676b'  # hsl(210°   4%  40%)
BLACK_COLOR6 = '#797f85'  # hsl(210°   5%  50%)

BROWN_COLOR1 =  '#201812'   # hsl( 26°  28%  10%)
BROWN_COLOR2 =  '#544035'   # hsl( 21°  23%  27%)
BROWN_COLOR3 =  '#785c4c'   # hsl( 22°  22%  38%)
BROWN_COLOR4 =  '#664E41'
BROWN_COLOR5 =  '#937868'   #  hsl( 22°  17%  49%)
BROWN_COLOR6 =  '#ad8b74'   #  hsl( 24°  26%  57%)

GRAY_COLOR1 =  '#171b1f'   # hsl(210°  15%  11%)
GRAY_COLOR2 =  '#45484b'   # hsl(210°   4%  28%)
GRAY_COLOR3 =  '#63676b'   # hsl(210°   4%  40%)
GRAY_COLOR4 =  '#54585B'
GRAY_COLOR5 =  '#828a8f'   # hsl(203°   5%  54%)
GRAY_COLOR6 =  '#98a2a8'   # hsl(203°   8%  63%)

GREEN_COLOR1 = '#1c4d29'   # hsl(136°  47%  21%)
GREEN_COLOR2 = '#2b7d4a'   # hsl(143°  49%  33%)
GREEN_COLOR3 = '#3db36a'   # hsl(143°  49%  47%)
GREEN_COLOR4 = '#34985A'
GREEN_COLOR5 = '#4bd675'  # hsl(138°  63%  57%)
GREEN_COLOR6 = '#63e278'  # hsl(130°  69%  64%)

PINK_COLOR1 = '#582258'  # hsl(300°  44%  24%)
PINK_COLOR2 = '#a45ca4'  # hsl(300°  28%  50%)
PINK_COLOR3 = '#eb83eb'  # hsl(300°  72%  72%)
PINK_COLOR4 = '#C86FC8'
PINK_COLOR5 = '#ffabf7'  # hsl(306° 100%  84%)
PINK_COLOR6 = '#fec7f9'  #  hsl(305°  96%  89%)


WHITE_COLOR1 = '#6a6c75'  # hsl(229°   5%  44%)
WHITE_COLOR2 = '#9ea1a4'  # hsl(210°   3%  63%)
WHITE_COLOR3 = '#e1e6eb'  # hsl(210°  20%  90%)
WHITE_COLOR4 = '#BFC3C8'
WHITE_COLOR5 = '#d5d7d9'  # hsl(210°   5%  84%)
WHITE_COLOR6 = '#ffffff'  # hsl(  0°   0% 100%)


body_colors = {
  'blue'   => [BLUE_COLOR1,BLUE_COLOR2,BLUE_COLOR3,
               BLUE_COLOR4,BLUE_COLOR5,BLUE_COLOR6],
  'red'    => [RED_COLOR1,RED_COLOR2,RED_COLOR3,
               RED_COLOR4,RED_COLOR5,RED_COLOR6],
  'purple' => [PURPLE_COLOR1,PURPLE_COLOR2,PURPLE_COLOR3,
               PURPLE_COLOR4,PURPLE_COLOR5,PURPLE_COLOR6],
  'black'  => [BLACK_COLOR1,BLACK_COLOR2,BLACK_COLOR3,
               BLACK_COLOR4,BLACK_COLOR5,BLACK_COLOR6],
  'brown'  => [BROWN_COLOR1,BROWN_COLOR2,BROWN_COLOR3,
               BROWN_COLOR4,BROWN_COLOR5,BROWN_COLOR6],
  'gray'   => [GRAY_COLOR1,GRAY_COLOR2,GRAY_COLOR3,
               GRAY_COLOR4,GRAY_COLOR5,GRAY_COLOR6],
  'green'  => [GREEN_COLOR1,GREEN_COLOR2,GREEN_COLOR3,
               GREEN_COLOR4,GREEN_COLOR5,GREEN_COLOR6],
  'pink'   => [PINK_COLOR1,PINK_COLOR2,PINK_COLOR3,
               PINK_COLOR4,PINK_COLOR5,PINK_COLOR6],
  'white'  => [WHITE_COLOR1,WHITE_COLOR2,WHITE_COLOR3,
               WHITE_COLOR4,WHITE_COLOR5,WHITE_COLOR6],
}

pp body_colors


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


color_names = body_colors.keys[1..-1]   ## cut-off first entry blue

BLUE_COLORS = body_colors['blue']

names.each do |name|
  ## note: use blue as a base as gray/black uses black as a color AND for outlines
  base = Image.read( "./attributes/body_i/#{name}-blue.png")
  puts "==>  #{name} colors:"

  color_names.each do |color_name|
    colors = body_colors[ color_name ]
    color_map = {}

    if color_name == 'white'
      color_map[WHITE_ISH]      = WHITE_COLOR6  # aka white (0xfff)
      color_map[WHITE_ISH2]     = WHITE_COLOR6   # aka white (0xfff)
      color_map[GRAY_ISH_LIGHT] = WHITE_COLOR5
      color_map[GRAY_ISH_DARK]  = WHITE_COLOR1
    end

    BLUE_COLORS.each_with_index do |hex,i|
      if color_name == 'white' && i==4
        color_map[ hex ] = WHITE_COLOR6  # aka white (0xfff)
      else
        color_map[ hex ] = colors[i]
      end
    end
    baseii = base.change_colors( color_map )
    baseii.save( "./tmp2/#{name}-#{color_name}.png" )
    baseii.zoom(4).save( "./tmp/#{name}-#{color_name}@4x.png" )
  end

end


puts "bye"
