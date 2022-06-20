require 'pixelart'


BLUE_COLOR1  = '#122b61'  # hsl(221°  69%  23%)
BLUE_COLOR2  = '#2f5392'  # hsl(218°  51%  38%)
BLUE_COLOR3  = '#4377d2'  # hsl(218°  61%  54%)
BLUE_COLOR4  = '#57c1ff'  # hsl(202° 100%  67%)

BLACK_ISH    = '#171b1f'  # hsl(210°  15%  11%)

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
          when BLACK_ISH      then  '  -  x black-ish'
          else ''
          end
    print "\n"
  end
end


names = %w[
  angry
  discerning
  focused
  open
  relaxed
  side-eye
]

names.each do |name|
  ## note: use blue as a base as gray/black uses black as a color AND for outlines
  base = Image.read( "./attributes/eyes_i/#{name}-blue.png")
  puts
  puts "==>  #{name} colors:"
  dump_colors( base )
end

puts "bye"

__END__


==>  angry colors:
1671  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
  8  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 30%)
 41  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%)            - color #1
  5  #2f5392 / rgb( 47  83 146) - hsl(218°  51%  38%)            - color #2
 11  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%)            - color #3
  6  #171b1f / rgb( 23  27  31) - hsl(210°  15%  11%)            -  x black-ish
  6  #ffffff / rgb(255 255 255) - hsl(  0°   0% 100%)           - WHITE
 16  #57c1ff / rgb( 87 193 255) - hsl(202° 100%  67%)            - color #4

==>  discerning colors:
1664  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
 11  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 30%)
 39  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%)            - color #1
 23  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%)            - color #3
 17  #57c1ff / rgb( 87 193 255) - hsl(202° 100%  67%)            - color #4
  5  #171b1f / rgb( 23  27  31) - hsl(210°  15%  11%)            -  x black-ish
  5  #ffffff / rgb(255 255 255) - hsl(  0°   0% 100%)           - WHITE

==>  focused colors:
1677  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
  4  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 30%)
 43  #171b1f / rgb( 23  27  31) - hsl(210°  15%  11%)            -  x black-ish
 18  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%)            - color #1
  4  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%)            - color #3
  6  #ffffff / rgb(255 255 255) - hsl(  0°   0% 100%)           - WHITE
 12  #57c1ff / rgb( 87 193 255) - hsl(202° 100%  67%)            - color #4

==>  open colors:
1643  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
 17  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 30%)
 40  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%)            - color #1
 34  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%)            - color #3
 18  #57c1ff / rgb( 87 193 255) - hsl(202° 100%  67%)            - color #4
  6  #171b1f / rgb( 23  27  31) - hsl(210°  15%  11%)            -  x black-ish
  6  #ffffff / rgb(255 255 255) - hsl(  0°   0% 100%)           - WHITE

==>  relaxed colors:
1691  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
  5  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 30%)
 20  #171b1f / rgb( 23  27  31) - hsl(210°  15%  11%)            -  x black-ish
 20  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%)            - color #1
  8  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%)            - color #3
 16  #57c1ff / rgb( 87 193 255) - hsl(202° 100%  67%)            - color #4
  4  #ffffff / rgb(255 255 255) - hsl(  0°   0% 100%)           - WHITE

==>  side-eye colors:
1702  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
  6  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 30%)
 32  #122b61 / rgb( 18  43  97) - hsl(221°  69%  23%)            - color #1
  6  #171b1f / rgb( 23  27  31) - hsl(210°  15%  11%)            -  x black-ish
  2  #ffffff / rgb(255 255 255) - hsl(  0°   0% 100%)           - WHITE
 14  #4377d2 / rgb( 67 119 210) - hsl(218°  61%  54%)            - color #3
  2  #57c1ff / rgb( 87 193 255) - hsl(202° 100%  67%)            - color #4