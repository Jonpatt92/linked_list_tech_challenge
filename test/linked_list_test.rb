require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'
require './lib/linked_list.rb'

class LinkedListTest < Minitest::Test
  def setup
    @list = LinkedList.new
  end

  def test_list_exists
    assert_instance_of LinkedList, @list
  end

  def test_it_has_attributes
    assert_nil @list.head
  end

  def test_it_can_append_node
    @list.append("West")

    assert_instance_of Node, @list.head
    assert_equal "West", @list.head.surname
    assert_nil @list.head.next_node
  end

  def test_it_can_count_nodes
    @list.append("West")

    assert_equal 1, @list.count
  end

  def test_it_can_produce_string
    assert_equal "The Families have all perished", @list.to_string

    @list.append("West")

    assert_equal "The West Family", @list.to_string
  end
end
