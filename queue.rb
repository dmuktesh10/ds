require './node'
require './ds_errors'

class Queue
  attr_accessor :head 
  def initialize
    @head = nil
  end

  def empty?
    head.nil? 
  end

  def add(datum)
    node = Node.new(datum)
    current = head
    if self.empty?
      self.head = node
    else
      while(!current.next.nil?)
        current = current.next
      end
      current.next = node 
    end
    head
  end

  def print_queue
    current = head 
    while(!current.next.nil?)
      print "#{current.data} =>"
      current = current.next
    end
    print "#{current.data}\n"
  end

  def remove
    if self.empty?
      raise EmptyQueue
    else
      node = head 
      self.head = head.next
    end
    node.data
  end

end