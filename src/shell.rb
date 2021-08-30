#

ruby_version = RUBY_VERSION

puts "Hello World! (ruby #{ruby_version})\n";

#

# https://stackoverflow.com/questions/7190015/how-do-i-get-a-list-of-files-that-have-been-required-in-ruby

# alias :orig_require :require
# def require s
#   print "Requires #{s}\n" if orig_require(s)
# end

# https://repl.it/repls/ItchyOrangeredCodewarrior#main.rb

# ruby shell.rb
# ruby -I . -r "shell" -e "Shell.new.test_loops_iterators" arg1 arg2
# ruby -I . -r "shell" -e "Shell.new.test_postgress"
# ruby -I . -r "shell" -e "Shell.new.test_s3"

require 'pg'
require 'uri'
require 'aws-sdk'
require 'json'

class Shell
  def test_loops_iterators
    puts ARGV
    puts 'https://launchschool.com/books/ruby/read/loops_iterators'

    i = 0
    loop do
      i += 2
      puts i
      if i == 10
        break # this will cause execution to exit the loop
      end
    end
  end

  # rubocop:disable Metrics/MethodLength
 
end

shell = Shell.new
response = shell.test_loops_iterators
puts "response: #{response}"
