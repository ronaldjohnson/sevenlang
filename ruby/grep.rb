#!/usr/bin/env ruby

def grep (pattern, filename)
	f = File.open(filename, 'r')
	f.each {|line| 
		if(line.match(pattern))
			puts "#{filename}: #{f.lineno}: #{line}"
		end
	}
end

puts
grep "Lorem", "lorem.txt"
