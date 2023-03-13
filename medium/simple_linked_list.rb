# Problem:
# An element contains data and a next field pointing to the next element
# Elements are in the list of elements.
# Linked lists use LIFO (Last in , first out)
# Elements have numbers 1 through 10 as the data.
# We have to be able to convert the linked list to and from an array.
# We have to be able to reverse the linked list.
# Algorithm:
# Create Element class
# Create SimpleLinkedList class

class Element
  attr_reader :datum, :next

  def initialize(datum, next_ele = nil)
    @datum = datum
    @next = next_ele
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :size, :head

  def initialize
    @size = 0
  end

  def self.from_a(array)
    array = [] if array.nil?
    list = new

    array.reverse_each do |datum|
      list.push(datum)
    end
    list
  end

  def empty?
    size.zero?
  end

  def push(datum)
    new_ele = Element.new(datum, @head)
    @size += 1
    @head = new_ele
  end

  def peek
    head&.datum if head
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    @size -= 1
    datum
  end

  def to_a
    array = []
    current_ele = head
    while current_ele
      array << current_ele.datum
      current_ele = current_ele.next
    end
    array
  end

  def reverse
    current_list = to_a
    new_list = SimpleLinkedList.new
    current_list.each do |ele|
      new_list.push(ele)
    end
    new_list
  end
end
