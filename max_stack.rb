require_relative 'linked_list'
require_relative 'stack'

# Implement a "max stack" - a stack that has a contant-time
# "maximum" operations.
def find_max(a, b)
  a.to_f > b.to_i ? a : b
end

class MaxStack < Stack
  def initialize
    super
    @max = -Float::INFINITY
  end

  # Places +item+ on the top of the stack
  def push(item)
    @max = find_max(@max, item)
    new_max = [item, @max]
    super(new_max)
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

  def empty?
    super
  end

  # Return the number of items on the stack
  def size
  end

  # Returns the largest item on the stack
  # O(1) time
  def max
    empty? ? -Float::INFINITY : @list.head.value[1]
  end
end
