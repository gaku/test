(1..10).each do |x|
  if x < 5
    puts "less than five"
    next
  end
  puts x
end
