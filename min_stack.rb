require_relative 'linked_list'
require_relative 'stack'

# Implement a "min stack" - a stack that has a contant-time
# "minimum" operations.

def find_min(a, b)
  a.to_f < b.to_i ? a : b
end

class MinStack < Stack
  def initialize
    super
    @min = Float::INFINITY
  end

  # Places +item+ on the top of the stack
  def push(item)
    @min = find_min(@min, item)
    new_min = [item, @min]
    super(new_min)
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  def pop
    super[0]
  end

  # Return the item on the top of the stack without removing it
  def peek
    super[0]
  end

  # Return true if the stack is empty and false otherwise
  def empty?
    super
  end

  # Return the number of items on the stack
  def size
    super
  end

  # Returns the smallest item on the stack
  # O(1) time
  def min
    empty? ? Float::INFINITY : @list.head.value[1]
  end
end
