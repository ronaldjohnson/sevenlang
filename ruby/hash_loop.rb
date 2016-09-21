#!/usr/bin/env ruby

veggie_hash = {:brussel_sprouts => true, :ham => false}

puts
veggie_hash.each do |key, value|
    puts "#{key} => #{value}"
end


## Arrays can be used as stacks, queues, and linked lists