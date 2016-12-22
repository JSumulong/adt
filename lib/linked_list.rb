require_relative 'exceptions'

class LinkedList
	def initialize
		# @first_item = nil
		@list = nil
	end

	def add(new_item)
		if list
			list_item = list
			i = 1
			loop do 
			# until list_item.next == nil
				if list_item.next == nil
					# The code below is wrong...
					# I don't want to get the value of the instance variable
					# instead I want to set the name of the variable as the next node
					# e.g., @node_1, @node_2
					list_item.next = instance_variable_get("@node_#{i}")
					p list_item
					break
				end
				list_item = list_item.next
				i += 1
			end
			instance_variable_set("@node_#{i}", Node.new(new_item))
			p self
		else
			# @first_item = Node.new(new_item)
			@list = Node.new(new_item)
			# @list.next = @node_1
		end
	end

	def get(index)
		list_item = list
		index.times do 
			list_item = list_item.next
		end
		list_item.element
	end

	private
	attr_reader :list

end
