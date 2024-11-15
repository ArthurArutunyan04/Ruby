require_relative 'html_tree'
require_relative 'tag'
require_relative 'tree_traverser'

html_tree = HTML_tree.new('C:/Users/Artur/Desktop/Index.html')
puts html_tree


tree_traverser = TreeTraverser.new(html_tree.root)

puts "\nОбход в ширину:"
tree_traverser.BFS { |tag| puts tag.short_info }

puts "\nОбход в глубину:"
tree_traverser.DFS { |tag| puts tag.short_info }

puts "Теги, у которых есть атрибуты:"
tags_with_attributes = tree_traverser.find_all { |tag| tag.has_attributes? }
tags_with_attributes.each { |tag| puts tag.tag_name }


