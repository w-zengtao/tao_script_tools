#!/usr/bin/env ruby

$ec = Encoding::Converter.new("GBK", "UTF-8", :universal_newline => true)

$ans = Array.new

class String
  def to_utf8
    return $ec.convert self
  end
end

File.open('color.txt') do |file|
  file.each_line do |line|
    utfline = line.to_utf8.strip.split('#')
    tmp = Array.new
    tmp.push(utfline[0])
    tmp.push('#' + utfline[1])
    $ans.push(tmp)
  end
end

puts $ans.to_s