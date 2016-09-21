#!/usr/bin/env ruby

module ActAsCsv

	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def act_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')

			file.each do |row|
				@csv_contents << row.chomp.split(', ')
			end
		end

		attr_accessor :headers, :csv_contents

		def initialize
			read
		end

		def each(&block)
			csv_contents.each do|row|
				block.call CvsRow.new(row, headers)
			end
		end

	end

end

class CvsRow
	attr_accessor :row, :headers

	def initialize(row, headers)
		@row = row
		@headers = headers	
	end

	def method_missing methId, *args
		column = methId.id2name
		index = headers.index column
		row.at index
	end
end

class RubyCsv
	include ActAsCsv
	act_as_csv
end	

## Main()
#####################
puts
m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

puts "====================================="
m.each {|row| puts row.one}
