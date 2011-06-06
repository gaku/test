require 'rubygems'
require "execjs"

# JavaScript literal is intepreted.
# JavaScript array is converted into a ruby array.
puts ExecJS.eval "'red yellow blue'.split(' ')"

