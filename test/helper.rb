# encoding: utf-8


require 'logutils'
require 'textutils'

# note: for now use "packaged" version in gem
#  (not the source in ../feedparser/lib)
require 'feedparser'


require 'minitest/autorun'


LogUtils::Logger.root.level = :debug



def walk(root, &block)
  Dir.foreach(root) do |name|
    ## puts "name: #{name}"
    path = File.join(root, name)

    if name == '.' || name == '..'
      next
    elsif File.directory?( path )

      ## note: skip .git !!
      ##        test folder with ruby test scripts
      next if ['.git', 'test'].include?( name )

      puts "** directory: #{path}/"
      walk( path, &block )
    else
      puts "  #{name}"
      block.call( path )   ## same as yield( path )
    end
  end
end


## add custom assert
module MiniTest
class Test

  def assert_feed( text, tests )

    feed = FeedParser::Parser.parse( text )

    tests.each_line do |line|

      if line =~ /^[ \t]*$/
        next        ## skip blank lines
      end

      line = line.strip


      if line.start_with? '#'
        next   ## skip comment lines too
      elsif line.start_with? '>>>'
        ## for debugging allow "custom" code e.g. >>> pp feed.items[0].summary etc.
        code = line[3..-1].strip
      else
        pos = line.index(':')   ## assume first colon (:) is separator
        expr  = line[0...pos].strip    ## NOTE: do NOT include colon (thus, use tree dots ...)
        value = line[pos+1..-1].strip

        ##  for ruby code use |>  or >> or >>> or =>  or $ or | or RUN or  ????
        ##   otherwise assume "literal" string

        if value.start_with? '>>>'
           value = value[3..-1].strip
           code="assert_equal #{value}, #{expr}"
        elsif value.start_with? 'DateTime'         ## todo/fix: remove; use >>> style
          code="assert_equal #{value}, #{expr}"
        else # assume value is a "plain" string
          ## note use %{ } so value can include quotes ('') etc.
          code="assert_equal %{#{value}}, #{expr}"
        end
      end

      puts "eval #{code}"
      eval( code )
    end  # each line
  end

end
end # module MiniTest
