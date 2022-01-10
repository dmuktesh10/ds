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
  list.delete_node(4)
  list.delete_node(15)
  list.delete_node(12)
  #list.delete_node(-23)

  list.add(3)
  list.add(33)
  list.add(234)


  list.print_list
  list.delate_at(0)
  list.print_list
  list.delate_at(2)
  list.print_list
  list.delate_at(22)
  list.print_list

  list.destroy
  list.print_list

rescue DataNotFoundError => ex
  puts ex.message
end

call