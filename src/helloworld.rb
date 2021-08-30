require 'rubygems'
require 'bundler/setup'

# require your gems as usual
require 'pg'
# require 'aws-sdk'

# require 'net/http'

# uri = URI.parse("http://www.packit4me.com/api/call/preview")
# http = Net::HTTP.new(uri.host, uri.port)
# response = http.post(uri.path, "bins=0:50:5x5x5&items=0:0:0:1x2x3,0:0:0:1x2x3,0:0:0:1x2x3&binId=0")

#

gems = Gem::Specification.map{|g| [g.name, g.version.to_s].join('-') }
puts "#{gems}\n\n";

# Gem::Specification.sort{|a,b| a.name <=> b.name}.map {|a| puts "#{a.name} (#{a.version})"; puts "-" * 50; puts a.homepage; puts a.description; puts "\n\n"};nil

ruby_version = RUBY_VERSION

puts "Hello World! (ruby #{ruby_version})\n";

# puts 'LOAD_PATH: '
# puts $LOAD_PATH