#!/usr/bin/env ruby
# -*- coding: ISO-8859-1 -*-

require "open-uri"
require "uri"

$flag = /name="price"/

begin 
  open('http://www.ikea.com/cn/zh/catalog/products/80213776/') do |f|
    f.each_line do |line|
      puts '-' * 100
      puts line
    end
  end
  
rescue
  nil
end

puts '毛慧是煞笔'

# html = open('http://www.baidu.com').readline
 # if html = open('httpwww.ikea.comcnzhcatalogproductsS79892936').read
 #
 # else
 #
 # end



# END_CHARS = %{.,'?!:;}
# puts URI.extract(html, ['http']).collect { |u| END_CHARS.index(u[-1]) ? u.chop : u }
# html.each_line do |line|
#   puts '-' * 50
#   puts line
# end

# uri = URI.parse('http://www.ikea.com/cn/zh/catalog/products/70261640/')
# URI.parse('http://www.ikea.com/cn/zh/catalog/products/70261640/').open do |file|
#   file.each_line do |line
#     # if line.strip =~ $flag
#     #   puts line
#     # end
#     puts '-' * 100
#     puts line
#   end
# end