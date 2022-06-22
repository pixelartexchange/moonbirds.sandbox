require 'moonbirds'


## week of June 20th 2022
##   see https://www.nft-stats.com/collection/proof-moonbirds

## notes on attribute mappings:
#
# 1)  body & feathers   are one attribute
#    e.g.
#      Body: Ruby Skeleton (& Feathers: Legendary Bone)  =>  Ruby Skeleton
#      Body: Skeleton      (& Feathers: Legendary Bone)  =>  Skeleton
#      Body: Crescent      (& Feathers: Blue)            =>  Blue Crescent
#      Body: Emperor       (& Feathers: Black)           =>  Black Emperor
#      Body: Tabby         (& Feathers: Red)             =>  Red Tabby
#      ...
#
# 2)  beak   - requires color  (e.g. Gray/Orange  or Ruby/Skeleton/Robot/Golden/etc.)
#    e.g.
#      Beak: Small   (& Body: Ruby Skeleton)        =>  Small (Ruby)
#      Beak: Long    (& Body: Skeleton)             =>  Long (Skeleton)
#      Beak: Small    + Color e.g. Gray|Orange      =>  Small (Orange)
#      Beak: Small    + Color e.g. Gray|Orange      =>  Small (Gray)
#
# 3)  eyes   - requires color (e.g. Black/White/Green/etc.  or Ruby/Skeleton/Robot/etc.)
#    e.g.
#      Eyes:  Relaxed (& Body: Ruby Skeleton)        =>  Relaxed (Ruby)
#      Eyes:  Open    + Color e.g. Black/White/etc.  =>   Open (White )


specs = Csv.parse( <<TXT )
  Ruby Skeleton, Small (Ruby),     Relaxed (Ruby),  Crescent Talisman
  Skeleton,      Long (Skeleton),  Visor,          Space Helmet
  Blue Crescent, Small (Orange),   Hearts,       Witch's Hat, Gold Chain

  Black Emperor, Small (Gray),   Open (White),       Half-Moon Specs
  Red Tabby,     Small (Orange), Discerning (White), Monocle
  Ruby Skeleton, Small (Ruby),   Relaxed (Ruby),   Aviator's Cap

  White Tabby,   Small (Gray),   Open (Green),   Gremplin
  Red Crescent,  Small (Orange), Open (Green),   Rubber Duck
  Ruby Skeleton, Small (Ruby),   Relaxed (Ruby), Dancing Flame
TXT



birds = ImageComposite.new( 3, 3,
                            width: 42,
                            height: 42,
                            background: '#FFBF00' )


specs.each do |attributes|
   bird = Moonbird::Image.generate( *attributes )
   birds << bird
end


birds.save( "./tmp/birds_topseller.png")
birds.zoom(4).save( "./tmp/birds_topseller@4x.png")
birds.zoom(8).save( "./tmp/birds_topseller@8x.png")

puts "bye"
