# Implement a LinkedList single/double linked.
# Psuedocode
#  {head, tail} both of type Node
# Node class - {next, prev, value}
class Node
  attr_accessor :next, :val
  def initialize(val, nexto: nil)
    @next = nexto
    @val = val
  end
end

class LinkedList
  attr_accessor :head

  def initialize(head: nil)
    @head = head
  end

  # Add to the front of the LinkedList
  def prepend(val)
    node = Node.new(val)
    node.next = @head
    @head = node
  end

  # Add to the end of the Linked List
  def append(val)
    if @head.nil?
      @head = Node.new(val)
      return
    end

    node = @head
    until node.next.nil?
      node = node.next
    end

    node.next = Node.new(val)
  end

  def delete(val)
    node = @head
    return if node.nil? 
    if node.val.equal? val 
      @head = node.next
      return val
    end
    until node.next.nil?
      if node.next.val.equal? val
        node.next = node.next.next
        return val
      end
      node = node.next
    end
    return nil
  end

  def visit
    return "#[]" if @head.nil?
    node = @head
    str = '[h: '
    until node.next.nil?
      str << node.val.to_s
      node = node.next
      str << " :-> "
    end
    str << node.val.to_s << "]"
  end
end