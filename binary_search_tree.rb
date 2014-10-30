require_relative 'binary_tree'

# Implement a binary search tree.
# See http://en.wikipedia.org/wiki/Binary_search_tree
# Operations to support:
#   include?(value)     Average O(log n) time
#   insert(value)       Average O(log n) time
#   remove(value)       Average O(log n) time
#   empty?              O(1) time

class BinarySearchTree < BinaryTree

  def initialize(value)
    super(value)
  end

  def insert(val)
    if self.value < val
      if (self.right)
        self.right.insert(val)
      else
        self.right = BinarySearchTree.new(val)
      end
    else
      if (self.left)
        self.left.insert(val)
      else
        self.left = BinarySearchTree.new(val)
      end
    end
  end

  def include?(val)
    if self.value == val
      true
    elsif self.value < val
      if self.right
        self.right.include?(val)
      else
        self.right == val
      end
    else
      if (self.left)
        self.left.include?(val)
      else
        self.left == val
      end
    end
  end

  def remove(val)
    if self.value == val
      self.value = nil
    elsif self.value < val
      if self.right
        self.right.remove(val)
      else
        self.right = nil
      end
    else
      if (self.left)
        self.left.remove(val)
      else
        self.left = nil
      end
    end
  end
end
