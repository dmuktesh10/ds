require './node'

class Stack

  attr_accessor :top

  def initialize
    @top = nil
  end

  def empty?
    top.nil?
  end

  def push(data)
    node = Node.new(data)
    if !self.empty?
      node.next = top
    end
    self.top = node
    top
  end

  def pop
    poped_node = top 
    self.top = top.next 
    poped_node
  end

  def print_stack
    current = top
    while(!current.next.nil?)
      print "#{current.data} =>"
      current = current.next
    end
    print current.data
  end

  def size
    count = 0
    current = top 
    while(!current.nil?)
      count += 1
      current = current.next
    end 
    count
  end
end 