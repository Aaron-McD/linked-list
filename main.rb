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
puts list.size

list.insert_at(25, 4)

puts list
puts list.size

list.remove_at(12)

puts list
puts list.size
