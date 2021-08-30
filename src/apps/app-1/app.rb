# https://stackoverflow.com/questions/7190015/how-do-i-get-a-list-of-files-that-have-been-required-in-ruby

puts "s"

alias :orig_require :require
def require s
  print "Requires #{s}\n" if orig_require(s)
end