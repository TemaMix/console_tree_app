#encoding: utf-8
require 'rubygems'
require 'pry'
require 'bundler/setup'
Dir.glob('./app/*.rb').each { |file| require file }

next_command = ['y','yes']
tree = Tree.new

while true
  puts <<-eos
Расчет путей в корневом N-арном дереве, в котором:
  • каждая вершина имеет ровно A дочерних вершин;
  • каждое ребро имеет вес;'
  • веса ребер равны: 1, 2, 3, ... , A.
>>
  eos

  begin
    params = {}

    puts 'Введите размерность дерева A:'
    params[:volume] = gets.chomp.to_i

    puts 'Введите максимальный вес пути N:'
    params[:weight] = gets.chomp.to_i

    puts 'Введите вес ребра [дополнительное условие] D:'
    params[:proviso] = gets.chomp.to_i

    tree.setup_value(params)

    puts "\n Результат: #{tree.calculate} "



  rescue ValidTree::ParamsError => e
    puts "Ошибка, пожалуйста исправьте:"
    puts e.full_messages
  end
  puts "\nЕще раз (Y/N):"
  command = gets.chomp
  break unless next_command.include?(command.downcase)
end






