require './node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = Node.new
  end

  def add(data)
    if head.data.nil?
      head.data = data
    else
      current_node = head
      while(!current_node.next.nil?)
        current_node = current_node.next
      end
      current_node.next = Node.new(data)
    end
    head
  end

  def print_list
    current_node = head
    while(!current_node.nil?)
      p current_node.data
      current_node = current_node.next
    end
  end
end
