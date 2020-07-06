require_relative "LinkedList"

list = LinkedList.new([10,11,12,13])

list.append(10)
list.append(11)
list.append(12)
list.append(13)
list.append(14)
list.prepend(9)
list.prepend(8)
list.prepend(7)
list.prepend(6)
list.prepend(5)

puts list
puts list.head
puts list.tail
puts list.at(4)
puts list.contains?(15)
puts list.contains?(9)
puts list.find(15)
