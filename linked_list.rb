require './node'
require 'pry-byebug'

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
      current_node = current_node.next
    end
  end
  
  def tail
    current_node = head
    while(!current_node.next.nil?)
      current_node = current_node.next
    end
    current_node
  end

  def delete(data)
    if head.data == data
      self.head = head.next
    else
      prev, target = find(data, with_previous: true)
      prev.next = target.next
      target.next = nil
    end
    puts "DELETED #{data}"
  end

  def find(data, with_previous: false)
    current_node = head
    while !current_node.nil? && current_node.data != data
      prev = current_node
      current_node = current_node.next
    end

    raise DataNotFoundError.new('Data not found') if current_node.nil?

    with_previous ? [prev, current_node] : current_node
  end
end
