#!/usr/bin/env ruby

veggie_hash = {:potatoes => true, :brussel_sprouts => true}

puts "Hash...",
veggie_hash
puts

## puts veggie_hash.methods
puts "to array...",
a = veggie_hash.to_a
puts

## puts a.methods
puts "back to hash..."
puts Hash.try_convert(a)
 
## Hashes can be easily converted to Arrays using ::to_a 
## Arrays can be converted to hashes via the Hash constructor but  
## it has to be structured in pairs
