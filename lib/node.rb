class Node
	attr_accessor :next
	attr_reader :element

	def initialize(node_element)
		@element = node_element
		@next = nil
	end

end
