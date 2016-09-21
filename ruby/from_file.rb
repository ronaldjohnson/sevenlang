#!/usr/bin/env ruby

module FromFile

	def from_f 
		File.open(filename, 'r') do |f| 
			## puts f.methods
			f.each_line {|line| puts line}
		end
	end

end

class Listing
	include FromFile
	attr_accessor :filename

	def initialize(filename)
		@filename = filename
	end

	def to_s

	end
end

Listing.new('listing.txt').from_f

## With no associated block , File.open is a synonym for ::new