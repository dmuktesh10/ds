# typed: true
require './linked_list'
require './stack'
require './queue'
require './ds_errors'

def call_list
  list = LinkedList.new
  list.add(4)
  list.add(10)
  list.add(15)

  #puts list.inspect
  list.print_list
  p list.tail


  list.add(323)
  list.add(12)

  list.print_list

  target = list.find(15)
  puts "target #{target.inspect}"
  list.delete_node(4)
  list.delete_node(15)
  list.delete_node(12)

  list.add(3)
  list.add(33)
  list.add(234)

  puts "data at #{0} index is #{list.find_at(0).data}"
  puts "data at #{1} index is #{list.find_at(1).data}"
  puts "data at #{2} index is #{list.find_at(2).data}"

  list.print_list
  list.delate_at(0)
  list.print_list
  list.delate_at(2)
  list.print_list

  puts "1 from last #{list.find_nth_from_last(1).data}"
  puts "2 from last #{list.find_nth_from_last(2).data}"
  puts "3 from last #{list.find_nth_from_last(3).data}"

  puts "linked lis size iteratively: #{list.size}"
  puts "linked lis size recursively: #{list.length}"

  puts "search 234 in list recursively: #{list.search(234).inspect} "

  list.destroy
  list = LinkedList.new
  list.add(23)
  list.add(45)
  list.add(-2)
  list.add(0)
  list.add(443)
  list.add(4334345)
  list.print_list
  puts "middle of list: #{list.middle}"
  list.add(-3223)
  list.print_list
  puts "middle of list: #{list.middle}"
  list.add(22)
  list.print_list
  puts "middle of list: #{list.middle}"
  list.add(443)
  puts "443 occured #{list.count_data_occurance(443)} times"
  puts "has loop: #{list.has_loop?}"
  list.tail.next = list.head 
  puts "has loop: #{list.has_loop?}"

#  list.delete_node(-23)
  list.find_at(22)

rescue DataNotFoundError => ex
  puts ex.message
end

def call_stack
  stack = Stack.new
  puts "empty stack ? #{stack.empty?}" 
  puts "add 2 to stack: #{stack.push(2)}"
  print "print stack: " 
  stack.print_stack
  puts "add 0,32,434,-23,4345 to stack:"
  stack.push(0)
  stack.push(32)
  stack.push(434)
  stack.push(-23)
  stack.push(4345)
  stack.print_stack
end

def call_queue
  queue = Queue.new 
  puts "is queue empty? => #{queue.empty?}"
  queue.add(4)
  puts "is queue empty? => #{queue.empty?}"
  queue.add(233)
  queue.add(0)
  queue.add(-44)
  queue.add(324)
  queue.print_queue
  puts "removed: #{queue.remove}\n\n"
  queue.print_queue

end
call_queue
# call_stack
# call_list