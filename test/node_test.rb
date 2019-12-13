require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new("Burke")
  end

  def test_node_exists
    assert_instance_of Node, @node
  end

  def test_it_has_attributes
    assert_nil @node.next_node
    assert_equal "Burke", @node.surname
  end

  def test_add_node
    assert_nil @node.next_node
    
    @node.add_node("Handy")

    assert_equal "Handy", @node.next_node.surname
  end
end
