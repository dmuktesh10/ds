class Node
  attr_accessor :data, :next
  
  def initialize(data=nil)
    puts "Node initialized"
    @data = data
    @next = nil
  end

end