class Node
    def initialize(value = nil)
        @value = value
        @next_node = nil
        @last_node = nil
    end

    def value
        return @value
    end

    def reset_next_node
        @next_node = nil
    end

    def reset_last_node
        @last_node = nil
    end

    def value=(new_value)
        @value = new_value
    end

    def append(node)
        @next_node = node
    end

    def prepend(node)
        @last_node = node
    end

    def next_node
        return @next_node
    end

    def last_node
        return @last_node
    end

    def to_s
        return @value.to_s
    end
end