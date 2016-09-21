#!/usr/bin/env ruby


def generateArray()
	new_array = [];
	(1..16).each {|i| new_array.push(rand(10))}
	new_array;
end

## main
newArray = generateArray();
puts
puts "each..."
newArray.each {|x| puts x}

puts
puts "each_slice by 4..."
newArray.each_slice(4) {|y| p y}