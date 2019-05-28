require 'set'
require 'byebug'
class GraphNode

    attr_accessor :value, :neighbors, :visited_nodes

    def initialize(value)
        @value = value
        @neighbors = []
        @visited_nodes = Set.new()
    end

    def inspect
         @value
    end

    def bfs(starting_node,target_value) # node instance, 'a'
        # return target_value if @visited_nodes.include?(target_value)
        queue = [starting_node]
        # debugger
        until queue.empty?
            current_node = queue.shift
            unless @visited_nodes.include?(starting_node.value)
                return current_node.value if current_node.value == target_value
                queue += current_node.neighbors #.select{|node| !@visited_nodes.include?(node)}
                visited_nodes.add(queue.first.value)
            end
        end
        return nil
    end

end


#### 





#things to do
# construct a graphnode
# write breadth first search
# keep track of queue and ALL visited nodes


