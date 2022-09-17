require 'pixelart'


module Pixelart
class Image

  def sha256
    ## calculate and return a sha256 "unique" hexdigest
    ##    for checking for duplicates
    ##
    ##  for now use  widthxheight  as string
    ##   and all pixels (as true color integers)
    ##   as strings separated by commas
    ##
    ##  eg.  24x24,4444,4444,444,....
    ##
    digest = Digest::SHA2.new
    digest.update( "#{@img.width}x#{@img.height}," )

    @img.height.times do |y|
      row = []
      @img.width.times do |x|
        row << @img[x,y].to_s
      end
      ## puts "#{y}: #{row.join(',')}"
      digest.update( ',' )    if y > 0
      digest.update( row.join(',') )
    end

    digest.hexdigest
  end

end  # class Image
end # module Pixelart




ATTRIBUTES = {}

root_dir = "./moonbirds-official/attributes"

# root_dir = "../../proofxyz/moonbirds-assets/traits"


subdirs = Dir.glob( "#{root_dir}/*" ).select { |path| File.directory?( path ) }
pp subdirs

subdirs.each do |dir|
  puts
  puts "==>  #{dir}"
  files = Dir.glob( "#{dir}/*.png" )
  pp files

  files.each do |path|

     img = Image.read( path )
     sha256 = img.sha256

     rec = ATTRIBUTES[ sha256 ] ||= { count: 0, paths: [] }
     rec[ :count ] += 1
     rec[ :paths ] << path
  end
end


## report duplicates:

ATTRIBUTES.each do |sha256, rec|
  if rec[:count] > 1
      puts
      puts "==>  #{rec[:count]} duplicates - sha256 >#{sha256}<:"
      rec[:paths].each do |path|
         dirname = File.dirname( path )
         basename = File.basename( path )
         puts "   #{basename} in (#{dirname})"
      end
  end
end


puts "bye"

__END__


==>  2 duplicates - sha256 >587338bd19a1dac79f8fe667916a69087d9d2686ce0cdcedba329f1b1979cd9b<:
  eyes/diamond-epic.png,
  eyes/open-diamond.png

==>  2 duplicates - sha256 >0ef5674821f3a378ab96af54d79b7a1cda79641e7aec4d662c4ead045bc1eb1f<:
  eyes/fire-epic.png,
  eyes/open-fire.png

==>  2 duplicates - sha256 >4df529b053464b4c0f02843535a33a60b9e3991d7d4da05a2ef51470cea648e4<:
  eyes/heart-epic.png,
  eyes/open-enchanted.png

==>  2 duplicates - sha256 >3f8e3e1d191524bb6defda9b65e9525ae7b2d1c0c50abaf556f52ca923ed1846<:
  eyes/moon-epic.png,
  eyes/open-moon.png

==>  2 duplicates - sha256 >87e8f92490bc464be1db92c9a9a069b493624e84adeab76622e9e4e2e5a43d54<:
  eyes/open-rainbow.png,
  eyes/rainbow-epic.png


==>  2 duplicates - sha256 >e4e362e194c2fa9ad136d00fd329c96169629a206e5fcff39f99a5f39d8f8abf<:
  eyes/open-ruby.png,
  eyes/open-skeleton.png

==>  2 duplicates - sha256 >371766a70b490e6f33d69f97fb5131047f947080b12954c3a2ef74238199eb74<:
  eyes/relaxed-ruby.png,
  eyes/relaxed-skeleton.png

 ==>  2 duplicates - sha256 >bcec807a49de99cddbb6daca090e3d7ed1a7b5d3fbfe833229d023f52b452a98<:
  eyes/adorable-ruby.png,
  eyes/open-adorable.png

 ==>  2 duplicates - sha256 >290facef32a9f94e8d6821457751af8addf29b0cdd46904dd9aed162e94ed244<:
   eyes/angry-ruby.png,
   eyes/angry-skeleton.png
