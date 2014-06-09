#encoding: utf-8
require 'rubygems'
require 'pry'
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
    calculate_proviso_path
  end


  def calculate_proviso_path
    create_tree.map do |node|
      proviso_for(node) ? node.weight : nil
    end
  end

  def proviso_for node
    if node.nil?
      false
    else
      node.edge >= @proviso ? true : proviso_for(node.parent)
    end
  end


  def create_tree
    root_node = NodeTree.new
    root_node.set_node(@volume)
    calculate_nodes(root_node)
  end


  def calculate_nodes(node, sum_node=[])
    if @weight >= node.weight
      node.add_children.map do |children_node|
        calculate_nodes(children_node, sum_node)
      end
    else
      puts "NODE #{node.parent.object_id} #{node.parent.edge}"
      binding.pry
      node.parent.edge
    end
  end



  # программа будет работать пока не будет командый выйти:
  #   exit, \q
  def start

  end

end