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
  attr_accessor :list

  def initialize(input=[])
    @list = input.map { |num| Element.new(num) }
  end

  def self.from_a(input)
    return new if input.nil?
    new(input)
  end

  def to_a
    list.to_a
  end

  def size
    list.size
  end

  def head
    list.last
  end

  def peek
    return nil if empty?
    head.datum
  end

  def empty?
    list.empty?
  end

  def push(datum)
    new_head = head
    @list << Element.new(datum, new_head)
  end

  def pop
    list.pop.datum
  end
end