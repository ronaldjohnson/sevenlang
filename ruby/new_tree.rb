#!/usr/bin/env ruby

class Tree
	attr_accessor :children, :node_name

	def initialize (tree_literal)
		@children = []
		tree_literal.to_a[0][1].each do |node|
			@children.push(Tree.new([].push(node)))
		end
		@node_name = tree_literal.to_a[0][0]
	end

	def visit_all(&block) 
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

# ruby_tree = Tree.new("Ruby", 
# 	[Tree.new("Reia"), 
# 	Tree.new("MacRuby")] )

literal_tree = {
	"grandpa" => { 
		"dad" => {
			"child 1" => {}, 
			"child 2" => {} 
		}, 
		"uncle" => {
			"child 3" => {}, 
			"child 4" => {} 
		} 
	}
};

ruby_tree = Tree.new(literal_tree);

puts
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

