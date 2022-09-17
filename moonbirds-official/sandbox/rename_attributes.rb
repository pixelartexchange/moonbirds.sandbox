###
#   helper script for "importing" the official moonbird attributes
#     rename filenames to all lowercase with no space and more



root_dir = "./moonbirds-official/attributes"

subdirs = Dir.glob( "#{root_dir}/*" ).select { |path| File.directory?( path ) }
pp subdirs

subdirs.each do |dir|
  puts
  puts "==>  #{dir}"
  files = Dir.glob( "#{dir}/*.png" )
  pp files

  files.each do |file|
    dirname  = File.dirname( file )
    basename = File.basename( file )

    new_basename = basename.downcase.
                            gsub( /[']/, '').
                            gsub( / - /, '-', ).
                            gsub( ' ', '_' )

    new_file = "#{dirname}/#{new_basename}"

    puts "  rename to >#{new_file}<"
    File.rename( file, new_file )
  end
end

puts "bye"