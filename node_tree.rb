#encoding: utf-8
require 'rubygems'
require 'bundler/setup'

class NodeTree

  attr_accessor :parent, :edge, :nodes

  @@count = 0

  def initialize(parent = nil, edge = 0, nodes = [])
    @@count += 1
    @parent = parent
    @edge = edge
    @nodes = nodes
  end

  def set_node(volume)
    @nodes = 1..volume
  end

  def self.counts
    @@count
  end

  def add_children
    nodes.map do |n|
      NodeTree.new(self, n, nodes)
    end
  end

  def weight
    edge + parent_weight
  end

  def parent_weight(sum = 0)
    @parent.nil? ? 0 : sum += @parent.parent_weight(@parent.edge)
  end

end