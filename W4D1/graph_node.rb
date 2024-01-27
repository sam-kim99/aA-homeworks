require 'set'
class GraphNode
    attr_accessor :value, :neighbors
    def initialize(val)
        @value = val
        @neighbors = []
    end

    def bfs(starting_node, target_value)
        return starting_node if starting_node.value == target_value

        visited = Set.new
        queue = [starting_node]
      
        until queue.empty?
          current_node = queue.shift
          next if visited.include?(current_node)
      
          return current_node if current_node.value == target_value
      
          visited.add(current_node)
          queue.concat(current_node.neighbors)
        end
        nil
    end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p a