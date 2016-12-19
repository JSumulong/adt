require_relative 'fixed_array'
require_relative 'exceptions'

class ArrayList

	def initialize
		@array = FixedArray.new(0)
		@size = array.size
	end

	def add(new_item)
		new_array_length = array.size + 1
		new_array = FixedArray.new(new_array_length)
		i = 0
		while i < array.size
			new_array.set(i, array.get(i))
			i += 1
		end
		new_array.set(array.size, new_item)
		@array = new_array
		new_item
	end

	def get(index)
		if index >= array.size
			raise NoSuchElementError.new("There is no element at the index of #{index}...")
		else
			array.get(index)
		end
	end

	def set(index, new_item)
		if index >= array.size
			raise NoSuchElementError.new(("There is no element at the index of #{index}..."))
		else
			array.set(index, new_item)
		end
	end

	def first
		if array.size > 0
			array.get(0)
		else
			raise NoSuchElementError.new(("The list is empty..."))
		end
	end

	def last
		if array.size > 0
			last_item_index = array.size - 1
			return array.get(last_item_index)
		else
			raise NoSuchElementError.new(("The list is empty..."))
		end
	end

	def insert(index, new_item)
		new_array_length = array.size + 1
		new_array = FixedArray.new(new_array_length)
		i = 0
		while i < index
			new_array.set(i, array.get(i))
			i += 1
		end
		new_array.set(i, new_item)
		j = i + 1
		while j < new_array_length
			new_array.set(j, array.get(j - 1))
			j += 1
		end
		@array = new_array
	end

	def length
		array.size
	end

private
	attr_reader :array

end
