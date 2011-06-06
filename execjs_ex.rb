require 'rubygems'
require "execjs"

# JavaScript literal is intepreted.
# JavaScript array is converted into a ruby array.
puts ExecJS.eval "'red yellow blue'.split(' ')"

# I only had JavaScriptCore.
puts "RubyRacer? #{ExecJS::Runtimes::RubyRacer.available?}"
puts "JavaScriptCore? #{ExecJS::Runtimes::JavaScriptCore.available?}"

