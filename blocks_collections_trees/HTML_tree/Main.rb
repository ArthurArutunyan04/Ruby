require_relative 'html_tree'
require_relative 'tag'
require_relative 'tree_traverser'

html_tree = HTML_tree.new('C:\Users\lartu\Ruby\blocks_collections_trees\HTML_tree\Index.html')
puts html_tree

puts "\nОбход в ширину:"
html_tree.each { |tag| puts tag.short_info }

puts "\nТеги, у которых есть атрибуты:"
tags_with_attributes = html_tree.select { |tag| tag.has_attributes? }
tags_with_attributes.each { |tag| puts tag.tag_name }

puts "Теги с наименьшим и с наибольшим количеством детей:"
tags_with_min_max_children = html_tree.minmax
puts tags_with_min_max_children
