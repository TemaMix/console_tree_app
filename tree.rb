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
    calculate_proviso_path.compact.size
  end


  def calculate_proviso_path
    get_low_nodes.map do |node|
      proviso_for(node) ? node.weight : nil
    end
  end

  # определяет дополнительное условие наложенное на вес ребра:
  #   одно из ребер, составляющих путь до конечного узла, должно иметь вес раный или больший чем @proviso
  def proviso_for node
    if node.nil?
      false
    else
      node.edge >= @proviso ? true : proviso_for(node.parent)
    end
  end


  def get_low_nodes
    root_node = NodeTree.new
    root_node.set_node(@volume)
    all_nodes = calculate_nodes(root_node)
    all_nodes.flatten.each do |node|
      puts "#### #{node.object_id} w: #{node.weight} ch #{node.children[0].object_id}  ch_s: #{node.children.size} pt #{node.parent.object_id}"
    end
    get_low all_nodes.flatten.uniq
  end


  def calculate_nodes(node)
    nodes = []
    nodes << node
    node.add_children.delete_if do |children_node|
      #binding.pry
      if @weight < children_node.weight
        true
      else
        nodes << calculate_nodes(children_node)
        false
      end
    end
    nodes
  end



  # программа будет работать пока не будет командый выйти:
  #   exit, \q
  def start

  end

  private

  def get_low nodes
    nodes.reject do |node|
      !node.children.empty?
    end
  end

end