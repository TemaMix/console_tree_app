#encoding: utf-8
require 'rubygems'
require 'bundler/setup'

class Tree
  # n - суммарный вес ребер - weight
  # d - условие - proviso
  # a - величена дерева - volume

  attr_accessor :weight, :volume, :proviso

  def setup_value(opts)
    @weight, @volume, @proviso = opts[:weight], opts[:volume], opts[:proviso]
  end

  def calculate

  end

  def node_calculate(parent = nil, edge = 0)
    current_node = if parent.nil?
      NodeTree.new
    else
      NodeTree.new(parent, edge)
    end
    current_node.set_node(@volume)
    node_weight = current_node.weight
    if @weight >= node_weight
      (current_node.nodes).map do |edge|
        node_calculate(current_node, edge)
      end
    else
      current_node.parent.weight
    end
  end

  def node_calculate_ver
    root_node = NodeTree.new
    root_node.set_node(@volume)
    calculate_nodes(root_node)
  end

  def calculate_nodes(node)
    if @weight > node.weight
      node.add_level.map do |children_node|
        calculate_nodes(children_node)
      end
    end
  end

  # программа будет работать пока не будет командый выйти:
  #   exit, \q
  def start

  end

end