#encoding: utf-8
require 'rubygems'
require 'bundler/setup'

class NodeTree

  attr_accessor :parent, :edge, :children, :children_size

  @@count = 0

  def initialize(parent = nil, edge = 0, children_size = nil)
    @@count += 1
    @parent = parent
    @edge = edge
    @children_size = children_size
  end

  def set_node(volume)
    @children_size = (1..volume)
    self
  end

  def self.counts
    @@count
  end

  def add_children
    @children ||= @children_size.map do |n|
      NodeTree.new(self, n, @children_size)
    end
  end

  def weight
    edge + parent_weight
  end

  def lower
    @children = nil
    self
  end

  def parent_weight(sum = 0)
    @parent.nil? ? 0 : sum += @parent.parent_weight(@parent.edge)
  end

end