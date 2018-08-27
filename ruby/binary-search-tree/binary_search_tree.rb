class Bst
  attr_reader :data, :left, :right
  attr_writer :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(data)
    new_node = Bst.new(data)
    
    current_node = self

    inserted = false

    while !inserted
      if new_node.data <= current_node.data
        if current_node.left.nil?
          current_node.left = new_node
          inserted = true
        else
          current_node = current_node.left
        end
      else
        if current_node.right.nil?
          current_node.right = new_node
          inserted = true
        else
          current_node = current_node.right
        end
      end
    end
  end
end