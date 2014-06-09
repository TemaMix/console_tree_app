#encoding: utf-8
require 'rubygems'
require 'bundler/setup'

class NodeTree

  attr_accessor :parent, :edge, :nodes

  @@count = 0

  def initialize(parent = nil, edge = 0, volume = [])
    @parent = parent
    @edge = edge
    @volume = volume
    @@count += 1
  end

  def set_node(volume)
    @nodes = 1..volume
  end

  def self.counts
    @@count
  end

  #TODO: rename add_level to add_children
  def add_level
    nodes.each do |n|
      NodeTree.new(self, n, nodes)
    end
  end

  def weight
    edge + parent_weight
  end

  def parent_weight(sum = 0)
    if  @parent.nil?
      #puts "### parent nil 0"
      return 0
    else
      #puts "#### current sum #{edge + @parent.weight(@parent.edge)} p #{edge} pe #{@parent.edge}"
      sum += @parent.parent_weight(@parent.edge)
    end
  end

end