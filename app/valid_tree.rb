#encoding: utf-8
require 'rubygems'
require 'pry'
require 'bundler/setup'

class ValidTree

  class ParamsError < StandardError
    attr_reader :full_messages

    def initialize(message = '')
      @full_messages = message
    end
  end

  attr_reader :opts

  def initialize(opts)
    @error_params = []
    @opts = opts
  end

  def valid
    begin
      opts.keys.each do |opt|
        send("valid_#{opt}")
      end
      raise ParamsError.new(print_message) unless error_empty?
    rescue NoMethodError => e
      puts "Использован не существующий параметр."
    rescue ParamsError => e
      raise
    else
      opts
    end
  end

  def valid_weight
    add(:weight) unless  1 <= opts[:weight]
  end

  def valid_volume
    add(:volume) unless (1 <= opts[:volume] and  opts[:volume] <= 100 )
  end

  def valid_proviso
    add(:proviso) unless (1 <= opts[:proviso] and opts[:proviso] <= opts[:volume])
  end

  def add(parameter)
    @error_params << parameter
  end

  def error_empty?
    full_messages.empty?
  end

  def print_message
    full_messages.join(" \n")
  end

  private

  def full_messages
    @error_params.map do |p|
      puts_message(p)
    end
  end

  def puts_message(parameter)
    case parameter
      when :weight
        " • максимальный вес пути должен быть представлен в виде целого положительного числа (1 ≤ N);"
      when :volume
        " • дерево не может иметь больше 100 дочерних вершин (A ≤ 100);"
      when :proviso
        " • дополнительное условие должно удовлетворять следующему требованию: 1 ≤ D ≤ A;"
    end
  end



end