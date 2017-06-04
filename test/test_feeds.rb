# encoding: utf-8

###
#  to run use
#     ruby -I ./test test/test_feeds.rb
#  or better
#     rake test

require  'helper'


class TestFeeds < MiniTest::Test

  def test_all

    walk( '.' ) do |path|

       ## note: skip README, Rakefile etc.
       ##    check for extensions
       extname = File.extname( path )    # note: includes dot e.g. .json etc.
       next unless ['.json', '.html', '.xml', '.rss', '.rss2', '.atom'].include?( extname )

  
       puts "  reading #{path} ..."

       b = BlockReader.from_file( path ).read

       ## puts "  [debug] block.size: #{b.size}"
       text  = b[0]   ## block I: feed source text (xml, json, html, etc.)
       tests = b[1]   ## block II: test assert source

       if tests.nil?
         puts "!!!! test asserts missing in #{path} !!!"
         ##  exit 1
       else
         assert_feed( text, tests )
       end
    end
  end  # method test_all

end # class TestFeeds
