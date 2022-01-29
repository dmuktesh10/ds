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
    if !empty?
      node.next = top
    end
    self.top = node
    top
  end

  def print_stack
    current = top
    
    while(!current.next.nil?)
      print "#{current.data} =>"
      current = current.next
    end
    print current.data
  end
end 