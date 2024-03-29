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

    assert_equal "The West family", @list.to_string
  end

  def test_it_can_append_multiple_linked_nodes
    @list.append("Rhodes")
    @list.append("Hardy")

    assert_equal "Hardy", @list.head.next_node.surname
    assert_nil @list.head.next_node.next_node
  end

  def test_it_can_count_multiple_nodes
    @list.append("Rhodes")
    @list.append("Hardy")

    assert_equal 2, @list.count

    @list.append("Smith")
    @list.append("Johnson")

    assert_equal 4, @list.count
  end

  def test_can_print_multiple_families
    @list.append("Rhodes")
    @list.append("Hardy")
    @list.append("Smith")
    @list.append("Johnson")

    expected = "The Rhodes family, followed by the Hardy family, followed by the Smith family, followed by the Johnson family"
    assert_equal expected, @list.to_string
  end

  def test_it_can_prepend
    @list.append("Hardy")
    assert_nil @list.head.next_node

    @list.append("Johnson")
    @list.prepend("Rhodes")
    assert_equal "Rhodes", @list.head.surname
    assert_equal "Hardy", @list.head.next_node.surname
    assert_equal 3, @list.count
  end

  def test_it_can_insert_one_position_over
    @list.append("Rhodes")
    @list.append("Hardy")
    @list.append("Smith")


    expected = "The Rhodes family, followed by the Inserted family, followed by the Hardy family, followed by the Smith family"

    @list.insert(1, "Inserted")

    assert_equal expected, @list.to_string
  end

  def test_it_can_insert_multiple_positions_over
    @list.append("Rhodes")
    @list.append("Hardy")
    @list.append("Smith")

    expected = "The Rhodes family, followed by the Hardy family, followed by the Inserted family, followed by the Smith family"

    @list.insert(2, "Inserted")

    assert_equal expected, @list.to_string

    expected = "The Rhodes family, followed by the Hardy family, followed by the Inserted family, followed by the Next family, followed by the Smith family"

    @list.insert(3, "Next")

    assert_equal expected, @list.to_string
  end

  def test_it_can_find_nodes
    @list.append("McKinney")
    @list.append("Lawson")
    @list.append("Brooks")
    @list.append("Henderson")

    expected = "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family"
    expected_1 = "The Brooks family"
    expected_2 = "The Lawson family, followed by the Brooks family, followed by the Henderson family"

    assert_equal expected,   @list.to_string
    assert_equal expected_1, @list.find(2, 1)
    assert_equal expected_2, @list.find(1, 3)
  end
end
