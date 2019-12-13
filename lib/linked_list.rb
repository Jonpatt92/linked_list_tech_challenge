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

  def count
    node_count = 0
    node = head
    until !node
      node = node.next_node
      node_count +=1
    end
    node_count
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

  def find_tail
    node = head
    until !node.next_node
      node = node.next_node
    end
    node
  end
end
