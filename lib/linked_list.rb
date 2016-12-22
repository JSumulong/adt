require_relative 'exceptions'

class LinkedList

	def initialize
		@list = nil
	end

	def add(new_item)
		if list # Is there already an element in the linked list
			list_item = list
			# Loop through the list items until the last item is reached
			# which will have a nil for #next
			until list_item.next == nil 
				list_item = list_item.next
			end
			list_item.next = Node.new(new_item)
			list_item.next.element
		else # If this is the first item in the linked list, simply create it...
			@list = Node.new(new_item)
		end
	end

	def get(index)
		list_item = list
		index.times do 
			raise NoSuchElementError.new("There is no element at the index of #{index}...") if list_item.next == nil
			list_item = list_item.next
		end
		list_item.element
	end

	def length
		i = 1
		list_item = list
		until list_item.next == nil
			list_item = list_item.next
			i += 1
		end
		i
	end

	private
	attr_reader :list

end
