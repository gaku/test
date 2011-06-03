# Dir.entries returns the files in the specified directory.
# Array.select constructs an array which consists of elements returned true.
#
files = Dir.entries(".").select { |item|
  if item.to_s.match(/^\./)
    false
  else
    true
  end
}
puts files
