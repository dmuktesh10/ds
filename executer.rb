require './linked_list'
require './data_not_found_error'

def call
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
  list.delete(4)
  list.delete(15)
  list.delete(12)
  list.delete(-23)
rescue DataNotFoundError
  puts "Data Not Found"
end

call