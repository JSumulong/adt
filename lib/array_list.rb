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
		array.get(index)
	end

	def length
		array.size
	end

private

	attr_accessor :array

end
