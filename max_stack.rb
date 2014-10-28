require_relative 'linked_list'
require_relative 'stack'

# Implement a "max stack" - a stack that has a contant-time
# "maximum" operations.

class MaxStack < Stack

  def initialize
    super
  end

  # Places +item+ on the top of the stack
  def push(item)
    new_max = [self.max, item.to_i].max
    super([item, new_max])
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
    super
  end

  # Returns the largest item on the stack
  # O(1) time
  def max
    empty? ? -Float::INFINITY : @list.head.value[1]
  end
end
