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
      @head.next_node = Node.new(surname)
    end
  end

  def count
    node_count = 0
    return node_count if !head

    if !head.next_node
      return node_count += 1
    else
      count_node_list
    end
  end

  def to_string
    if !head
      "The Families have all perished"
    elsif !head.next_node
      "The #{head.surname} Family"
    else
      gather_families
    end
  end

  def gather_families
    families = []
    node = head.next_node
    until !node.next_node
      families << node.surname + ', '
      node = node.next_node
    end
    families.last.delete! ', '
    "The #{families.flatten} Families"
  end

  def count_node_list
    node_count = 2
    node = head.next_node
    until !node.next_node
      node_count += 1
      node = node.next_node
    end
    node_count
  end
end
