class Node
    def initialize(value = nil)
        @value = value
        @next_node = nil
    end

    def value
        return @value
    end

    def value=(new_value)
        @value = new_value
    end

    def append(node)
        @next_node = node
    end

    def next_node
        return @next_node
    end
end