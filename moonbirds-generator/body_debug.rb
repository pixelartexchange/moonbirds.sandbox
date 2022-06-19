require 'pixelart'



BLUE_COLOR1 = '#122b61'  #  hsl(221°  69%  23%)  -- darkest
BLUE_COLOR2 = '#2f5393'  #  hsl(218°  52%  38%)
BLUE_COLOR3 = '#4377d2'  #  hsl(218°  61%  54%)
BLUE_COLOR4 = '#3965b3'  #  hsl(218°  52%  46%)
BLUE_COLOR5 = '#52a4ff'  #  hsl(212° 100%  66%)
BLUE_COLOR6 = '#57c1ff'  #  hsl(202° 100%  67%)

WHITE_ISH  = '#ebe4da'   #  hsl( 35°  30%  89%)
WHITE_ISH2 = '#f5efe6'   #  hsl( 36°  43%  93%)
GRAY_ISH_LIGHT = '#a4a099'  # hsl( 38°   6%  62%)
GRAY_ISH_DARK  = '#4d4843'  # hsl( 30°   7%  28%)





def dump_colors( img )
  usage = Hash.new(0)
  img.pixels.each do |color|
    usage[ color ] += 1
  end

  usage.each do |color,count|
    print "%3d  " % count
    print Color.format( color )

    hex = Color.to_hex( color, include_alpha: false )
    print case hex
          when BLUE_COLOR1    then  '  - color #1'
          when BLUE_COLOR2    then  '  - color #2'
          when BLUE_COLOR3    then  '  - color #3'
          when BLUE_COLOR4    then  '  - color #4'
          when BLUE_COLOR5    then  '  - color #5'
          when BLUE_COLOR6    then  '  - color #6'
          when WHITE_ISH      then  '  -  x white-ish'
          when WHITE_ISH2     then  '  -  x white-ish ii'
          when GRAY_ISH_LIGHT then  '  -  x gray-ish (light)'
          when GRAY_ISH_DARK  then  '  -  x gray-ish (dark)'
          else ''
          end
    print "\n"
  end
end


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

names.each do |name|
  ## note: use blue as a base as gray/black uses black as a color AND for outlines
  base = Image.read( "./attributes/body_i/#{name}-blue.png")
  puts
  puts "==>  #{name} colors:"
  dump_colors( base )


  if name == 'guardian'
    baseii =  base.change_colors( {
      '#3973b3' => '#ff0000',
      '#468bd9' => '#00ff00',
    })
    baseii.zoom(4).save( "./tmp/#{name}-debug@4x.png" )
    # 25  #3965b3 / rgb( 57 101 179) - hsl(218°  52%  46%)
    # 12  #3973b3 / rgb( 57 115 179) - hsl(211°  52%  46%)
    # 2  #468bd9 / rgb( 70 139 217) - hsl(212°  66%  56%)
  end

  ## 10  #3c6bbd / rgb( 60 107 189) - hsl(218°  52%  49%)
  if name == 'sage'
    baseii =  base.change_colors( {
       '#3973b3' => '#ff0000',
       '#3972b2' => '#00ff00',
       '#4d81bb' => '#0000ff',
       '#63adff' => '#ffff00',
       '#3c6bbd' => '#ff00ff',
    })
    baseii.zoom(4).save( "./tmp/#{name}-debug@4x.png" )
   # 7  #3973b3 / rgb( 57 115 179) - hsl(211°  52%  46%)
   # 1  #3972b2 / rgb( 57 114 178) - hsl(212°  51%  46%)
   # 2  #4d81bb / rgb( 77 129 187) - hsl(212°  45%  52%)
   # 14  #63adff / rgb( 99 173 255) - hsl(212° 100%  69%)
   # 10  #3c6bbd / rgb( 60 107 189) - hsl(218°  52%  49%)
  end

  if name == 'emperor'
    baseii =  base.change_colors( {
       '#9e9a93' => '#ff0000',
       '#e2dcd2' => '#00ff00',
    })
    baseii.zoom(4).save( "./tmp/#{name}-debug@4x.png" )
    # 6  #9e9a93 / rgb(158 154 147) - hsl( 38°   5%  60%)
    # 46  #e2dcd2 / rgb(226 220 210) - hsl( 38°  22%  85%)
  end

  if name == 'professor'
    baseii =  base.change_colors( {
       '#213a67' => '#ff0000',
    })
    baseii.zoom(4).save( "./tmp/#{name}-debug@4x.png" )
  # 1  #213a67 / rgb( 33  58 103) - hsl(219°  51%  27%)
  end
end



colors = %w[
  blue
  red
  purple
  black
  brown
  gray
  green
  pink
  white
]


colors.each do |color|
  ## note: use blue as a base as gray/black uses black as a color AND for outlines
  base = Image.read( "./attributes/body_i/brave-#{color}.png")
  puts
  puts "==>  #{color} colors (brave):"
  dump_colors( base )
end



puts "bye"


__END__

==>  brave colors:
1045  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
134  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%)
 51  #57c1ff / rgb( 87 193 255) - hsl(202° 100%  67%)
182  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%)
138  #2f5393 / rgb( 47  83 147) - hsl(218°  52%  38%)
  6  #52a4ff / rgb( 82 164 255) - hsl(212° 100%  66%)
183  #ebe4da / rgb(235 228 218) - hsl( 35°  30%  89%)
 25  #a4a099 / rgb(164 160 153) - hsl( 38°   6%  62%)

==>  crescent colors:
1139  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
 64  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%)
133  #2f5393 / rgb( 47  83 147) - hsl(218°  52%  38%)
177  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%)
  8  #52a4ff / rgb( 82 164 255) - hsl(212° 100%  66%)
 40  #a4a099 / rgb(164 160 153) - hsl( 38°   6%  62%)
197  #ebe4da / rgb(235 228 218) - hsl( 35°  30%  89%)
  6  #f5efe6 / rgb(245 239 230) - hsl( 36°  43%  93%)

==>  emperor colors:
1057  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
 98  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%)
 55  #52a4ff / rgb( 82 164 255) - hsl(212° 100%  66%)
337  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%)
165  #2f5393 / rgb( 47  83 147) - hsl(218°  52%  38%)
  6  #9e9a93 / rgb(158 154 147) - hsl( 38°   5%  60%)
 46  #e2dcd2 / rgb(226 220 210) - hsl( 38°  22%  85%)

==>  guardian colors:
1072  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
 86  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%)
 50  #52a4ff / rgb( 82 164 255) - hsl(212° 100%  66%)
 86  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%)
103  #2f5393 / rgb( 47  83 147) - hsl(218°  52%  38%)
 25  #3965b3 / rgb( 57 101 179) - hsl(218°  52%  46%)
 58  #a4a099 / rgb(164 160 153) - hsl( 38°   6%  62%)
 11  #f5efe6 / rgb(245 239 230) - hsl( 36°  43%  93%)
259  #ebe4da / rgb(235 228 218) - hsl( 35°  30%  89%)
 12  #3973b3 / rgb( 57 115 179) - hsl(211°  52%  46%)
  2  #468bd9 / rgb( 70 139 217) - hsl(212°  66%  56%)

==>  professor colors:
1052  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
112  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%)
 27  #52a4ff / rgb( 82 164 255) - hsl(212° 100%  66%)
 25  #3965b3 / rgb( 57 101 179) - hsl(218°  52%  46%)
177  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%)
139  #2f5393 / rgb( 47  83 147) - hsl(218°  52%  38%)
  1  #213a67 / rgb( 33  58 103) - hsl(219°  51%  27%)
 52  #a4a099 / rgb(164 160 153) - hsl( 38°   6%  62%)
178  #ebe4da / rgb(235 228 218) - hsl( 35°  30%  89%)
  1  #f5efe6 / rgb(245 239 230) - hsl( 36°  43%  93%)

==>  sage colors:
1092  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
 60  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%)
 28  #4d4843 / rgb( 77  72  67) - hsl( 30°   7%  28%)
106  #2f5393 / rgb( 47  83 147) - hsl(218°  52%  38%)
130  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%)
182  #ebe4da / rgb(235 228 218) - hsl( 35°  30%  89%)
 56  #52a4ff / rgb( 82 164 255) - hsl(212° 100%  66%)
 23  #f5efe6 / rgb(245 239 230) - hsl( 36°  43%  93%)
 53  #a4a099 / rgb(164 160 153) - hsl( 38°   6%  62%)
  7  #3973b3 / rgb( 57 115 179) - hsl(211°  52%  46%)
  1  #3972b2 / rgb( 57 114 178) - hsl(212°  51%  46%)
  2  #4d81bb / rgb( 77 129 187) - hsl(212°  45%  52%)
 14  #63adff / rgb( 99 173 255) - hsl(212° 100%  69%)
 10  #3c6bbd / rgb( 60 107 189) - hsl(218°  52%  49%)

==>  stark colors:
 59  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%) - color1 (darkest)
 55  #2f5393 / rgb( 47  83 147) - hsl(218°  52%  38%) - color2
 23  #52a4ff / rgb( 82 164 255) - hsl(212° 100%  66%) - color4

==>  tabby colors:
 78  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%) - color1
 37  #52a4ff / rgb( 82 164 255) - hsl(212° 100%  66%) - color4
156  #2f5393 / rgb( 47  83 147) - hsl(218°  52%  38%) - color2
325  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%) - color3

==>  tranquil colors:
 84  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%) - color1
105  #57c1ff / rgb( 87 193 255) - hsl(202° 100%  67%) - color5
122  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%) - color3
138  #2f5393 / rgb( 47  83 147) - hsl(218°  52%  38%) - color2
 12  #52a4ff / rgb( 82 164 255) - hsl(212° 100%  66%) - color4
bye


always keep as is:
white(-ish) - #ebe4da / rgb(235 228 218) - hsl( 35°  30%  89%)
white(-ish) 2 -#f5efe6 / rgb(245 239 230) - hsl( 36°  43%  93%)
   used in tranquil (10px),
(light) gray(-ish)  - #a4a099 / rgb(164 160 153) - hsl( 38°   6%  62%)
(dark)  gray(-ish)  - #4d4843 / rgb( 77  72  67) - hsl( 30°   7%  28%)
  used in stark (13px),
