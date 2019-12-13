require './lib/node.rb'
require 'pry'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(surname)
    if head == nil
      @head = Node.new(surname)
    else
      node = find_tail
      node.add_node(surname)
    end
  end

  def prepend(surname)
    new_node = Node.new(surname)
    if !head
      @head         = new_node
    else
      previous_head = head
      @head         = new_node
      head.set_next_node(previous_head)
    end
  end
  
  def insert(position, surname, node = head)
    new_node = Node.new(surname)
    (position - 1).times do
      unless !node.next_node
        node = node.next_node
      end
    end
    continuing_node = node.next_node
    inserted_node = node.set_next_node(new_node)
    inserted_node.set_next_node(continuing_node)
  end

  def count(node = head)
    if node == nil
      0
    else
      1 + count(node.next_node)
    end
  end

  def to_string
    if !head
      "The Families have all perished"
    else
      string = "The #{head.surname} Family"
      node = head.next_node
      until !node
        string += ", followed by the #{node.surname} family"
        node = node.next_node
      end
      string
    end
  end

  def find_tail(node = head)
    until !node.next_node
      node = node.next_node
    end
    node
  end
end

## Recursive Solution ##
# def append(surname)
#   new_node = Node.new(surname)
#   if head == nil
#     @head = new_node
#   else
#     append_recursive(@head, new_node)
#   end
# end
#
# def append_recursive(current_node, new_node)
#   if current_node.next_node = nil
#     current_node.next_node = new_node
#   else
#     append_recursive(current_node.next_node, new_node)
#   end
# end
