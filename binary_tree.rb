require './tree_node'
require './ds_errors'

class BinaryTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def height(node)
    if node.nil?
      0
    else
      lheight = height(node.left)
      rheight = height(node.right)
      lheight > rheight ? lheight + 1 : rheight + 1
    end
  end

  def add(data)
    new_node = TreeNode.new(data)
    if root.nil?
      self.root = new_node
      return
    end
    queue = [root]
    while(!queue.empty?)
      current = queue.shift 
      if current.left.nil?
        current.left = new_node
        break
      else
        queue << current.left
      end

      if current.right.nil?
        current.right = new_node
        break
      else
        queue << current.right
      end
    end
  end

  def delete(data)
    key_node=nil
    raise DataNotFoundError.new if(root.nil?)
    if single_node_tree?
      if root.data == data
        self.root = nil 
      else
        raise DataNotFoundError.new
      end
    end
    queue = [root]
    while(!queue.empty?)
      temp = queue.shift 
      key_node = temp if temp.data == data
      queue << temp.left if temp.left
      queue << temp.right if temp.right
    end
    if key_node
      deep_node_data = temp.data 
      delete_deep_node(temp)
      key_node.data = deep_node_data
    end
  end

  def single_node_tree? 
    root.left.nil? && root.right.nil?
  end

  def level_traversal
    tree_height=height(root)+1
    (1..tree_height).each do |i|
      print_current_level(root, i)
    end
  end

  def print_current_level(node, level)
    return if node.nil?
    if level == 1
      print "#{node.data} "
    elsif level > 1
      print_current_level(node.left, level-1)
      print_current_level(node.right, level-1)
    else
      ""
    end
  end
  private 

  def delete_deep_node(d_node)
    queue = [root]
    while(!queue.empty?)
      temp = queue.shift 
      temp = nil if temp.equal?(d_node)
      if(temp.left==d_node)
        temp.left = nil
        return 
      else
        queue << temp.left 
      end
      if(temp.right==d_node)
        temp.right = nil 
        return 
      else
        queue << temp.right 
      end
    end
  end
end