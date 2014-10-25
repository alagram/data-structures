class LinkedList
  # By implementing LinkedList#each, we can include Enumerable
  include Enumerable

  attr_reader :head, :tail

  def initialize
    @head = Node.new(nil)
    @tail = nil
  end

  # O(1) time
  # prepend/add node to front/biginning of LL
  def unshift(value)
    new_node = Node(value)

    new_node.next = @head
    @head = new_node

    self
  end

  # O(1) time
  # remove node from front/biginning of LL
  def shift
    result = @head.value
    @head = Node(@head.next)
    result
  end

  # O(1) time
  # add node to end of LL
  # def push(value)
  #   new_tail = Node(value)
  #   @tail.next = new_tail
  #   @tail = new_tail

  #   self
  # end

  # O(1) time
  def empty?
    self.head.empty?
  end

  def each(&block)
    node = self.head

    until node.empty?
      block.call(node.value)
      node = node.next
    end

    self
  end

end

# This allows us to call Node(value) and is different
# than the class "Node".  This is how Ruby methods
# like Integer(value), Array(value), String(value), etc.
# work.
def Node(value)
  case value
  when Node
    value
  else
    Node.new(value)
  end
end

class Node
  include Enumerable

  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next  = next_node
  end

  # O(1) time
  # Insert +value+ after this Node and return new Node
  def insert_after(value)
    node = Node(value)
    node.next = self
    node
  end

  def empty?
    value.nil?
  end
end
