require_relative "Node"

class LinkedList
    attr_reader :head, :tail
    def initialize(values = nil)
        # values can be an array to represent each new node in the linked list
        @head = nil
        @tail = nil
        @size = 0
        if(values != nil)
            fill_values(values)
        end
    end

    def size
        return @size
    end

    def append(value)
        node = Node.new(value)
        if(@size == 0)
            @head = node
            @tail = node
        else
            node.prepend(@tail)
            @tail.append(node)
            @tail = node
        end
        @size += 1
    end

    def prepend(value)
        node = Node.new(value)
        if(@size == 0)
            @tail = node
            @head = node
        else
            @head.prepend(node)
            node.append(@head)
            @head = node
        end
        @size += 1
    end

    def to_s
        string = "nil <-> "
        if(@size != 0)
            current_node = @head
            @size.times do
                string += current_node.value.to_s
                string += " <-> "
                current_node = current_node.next_node
            end
        end
        string += "nil"
        return string
    end

    def at(index)
        if(index >= @size || index < 0)
            return nil
        end
        i = 0
        current_node = @head
        while(i < index)
            current_node = current_node.next_node
            i += 1
        end
        return current_node
    end

    def pop
        node = @tail
        if(@size == 0)
            return nil
        elsif(@size != 1)
            @tail = @tail.last_node
            @tail.reset_next_node
            @size -= 1
        else
            @tail = nil
            @head = nil
            @size = 0
        end
        return node
    end

    def shift
        node = @head
        if(@size == 0)
            return nil
        elsif(@size != 1)
            @head = @head.next_node
            @head.reset_last_node
            @size -= 1
        else
            @tail = nil
            @head = nil
            @size = 0
        end
        return node
    end

    def contains?(value)
        if(@size == 0)
            return false
        end
        current_node = @head
        @size.times do
            if(current_node.value == value)
                return true
            else
                current_node = current_node.next_node
            end
        end
        return false
    end

    def find(value)
        if(self.contains?(value))
            i = 0
            current_node = @head
            while(i < @size)
                if(current_node.value == value)
                    return i
                else
                    current_node = current_node.next_node
                    i += 1
                end
            end
        else
            return nil
        end
    end

    def insert_at(value, index)
        if(index >= self.size)
            self.append(value)
        elsif(index <= 0)
            self.prepend(value)
        else
            node = Node.new(value)
            current_node = @head
            index.times do
                current_node = current_node.next_node
            end
            prev_node = current_node.last_node
            node.prepend(prev_node)
            prev_node.append(node)
            node.append(current_node)
            current_node.prepend(node)
            @size += 1
        end
    end

    def remove_at(index)
        if(index >= self.size)
            self.pop
        elsif(index <= 0)
            self.shift
        else
            current_node = @head
            index.times do
                current_node = current_node.next_node
            end
            next_node = current_node.next_node
            last_node = current_node.last_node
            next_node.prepend(last_node)
            last_node.append(next_node)
            @size -= 1
            current_node.reset_next_node
            current_node.reset_last_node
            return current_node
        end
    end

    private

    def fill_values(values)
        values.each do |val|
            self.append(val)
        end
    end
end