#encoding: utf-8
require 'rubygems'
require 'bundler/setup'

class Tree
  # n - суммарный вес ребер - weight
  # d - условие - proviso
  # a - величена дерева - volume

  def setup_value(opts)
    @weight, @volume, @proviso = validy_by(opts[:weight]), validy_by(opts[:volume]), validy_by(opts[:proviso])
  end

  def calculate

  end

  # программа будет работать пока не будет командый выйти:
  #   exit, \q
  def start

  end

end