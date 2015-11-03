#! /usr/bin/env ruby

require 'find'

@root_dir = Dir.pwd()
@dir_index = @root_dir.length()

def rename_file file_name
    
  full_name = file_name[(@dir_index + 1)..(file_name.length - 1)].gsub('/', '_').insert(-12, ARGV[0])
  dir_name = File.dirname(file_name)
  File.rename(file_name, dir_name + '/' + full_name)
  
end

Find.find(Dir.pwd) do |item|
  if !Dir.exist?(item)
    if (File.extname(item) == ".png" ||  File.extname(item) == ".jpg")
      rename_file item
    end
  end
end

puts "Script Over and Please Notice WARING:"
puts "WARING: this script can only use run once!"
