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

	def set(index, new_item)
		if index == 0 # handle setting the item at index 0
			next_item = list.next
			@list = Node.new(new_item)
			@list.next = next_item
		else
			list_item = list
			(index - 1).times do 
				list_item = list_item.next
				raise NoSuchElementError.new("There is no element at the index of #{index}...") if list_item.next == nil
			end
			next_item = list_item.next.next
			list_item.next = Node.new(new_item)
			list_item.next.next = next_item
		end
	end

	def first
		raise NoSuchElementError.new("The list is empty...") if !list
		list.element
	end

	def last 
		raise NoSuchElementError.new("The list is empty...") if !list 
		list_item = list
		until list_item.next == nil
			list_item = list_item.next
		end
		list_item.element
	end

	def insert(index, new_item)
		list_item = list
		if index == 0
			@list = Node.new(new_item)
			list.next = list_item
		else
			(index - 1).times do 
				list_item = list_item.next
			end
			raise OutOfBoundsError.new("Index is out of bounds...") if !list_item.next
			resume_next_item = list_item.next
			list_item.next = Node.new(new_item)
			list_item.next.next = resume_next_item
		end
	end

	private
	attr_reader :list

end
