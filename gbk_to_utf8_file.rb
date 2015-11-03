#!/usr/bin/env ruby

if defined? Encoding::Converter
  $ec1 = Encoding::Converter.new("GBK", "UTF-8", :universal_newline => true)
else
  puts "this can not be down by ruby under 1.9.3"
end

class String
  def to_uft8
    return $ec1.convert self
  end
end

file_name = ARGV[0]
b_file_name = file_name + '.bak'

s_file = File.open(file_name)
t_file = File.new(b_file_name, "w")

s_file.each_line do |line|
  t_file.write(line.to_uft8)
end

File.delete(file_name)
File.rename(b_file_name, file_name)

s_file.close
t_file.close