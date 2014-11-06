class LinkedList
  # By implementing LinkedList#each, we can include Enumerable
  include Enumerable

  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # O(1) time
  # prepend/add node to front/biginning of LL
  def unshift(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next = @head
      @head = new_node
    end

    self
  end

  # O(1) time
  # remove node from front/biginning of LL and return its value
  def shift
    return nil if @head.nil?

    result = @head.value
    @head = @head.next
    result
  end

  # O(1) time
  # remove node from front/beginning of LL and return it
  def remove_node
    return nil if @head.nil?

    result = @head
    @head = @head.next
    result
  end

  # O(1) time
  # add node to end of LL
  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next = new_node
      @tail = new_node
    end
  end

  # O(1) time
  def empty?
    self.head.nil?
  end

  def each(&block)
    node = self.head

    until node.nil?
      block.call(node.value)
      node = node.next
    end

    self
  end

  def reverse
    new_linked_list = LinkedList.new
    self.each { |list| new_linked_list.unshift(list) }
    new_linked_list
  end

  def reverse!
    return if @head.nil?

    @new_head = self.remove_node
    @new_head.next = nil

    until @head.nil?
      node = self.remove_node
      node.next = @new_head
      @new_head = node
    end

    @head = @new_head
  end

end


class Node
  include Enumerable

  attr_accessor :value, :next

  def initialize(value = nil, new_node = nil)
    @value = value
    @next  = new_node
  end
end
