def block_test1
  # block will be executed with yield statement.
  yield
end

def block_test2(arg1)
  puts arg1
  yield
end

def block_test3(arg1, &block)
  puts arg1
  block.call
end

def block_test4(&block)
  # this doesn't cause an error even if there's only one param in block
  puts "block.arity=#{block.arity}"
  block.call("1", "2")
end

def block_test5(arg1="default")
  yield arg1
end


block_test1 { puts "test1's block" }
block_test2("test2 arg2") { puts "test2's block" }
block_test3("test3 arg1") { puts "test3's block" }
block_test4 { |x| puts x }
block_test4 { |x,y,z| puts "x=#{x},y=#{y},z=#{z}" }
block_test5 { |x| puts "test5's block: #{x}" }
