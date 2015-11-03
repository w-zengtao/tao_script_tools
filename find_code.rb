#! /usr/bin/env ruby

require 'find'

$find_source = false
$find_header = false
$find_text = false
$find_erb = false
$find_rb = false
 
ARGV.each do |arg|
  if arg == '-h'
    $find_header = true
  elsif arg == '-s'
    $find_source = true
  elsif arg == '-t'
    $find_text = true
  elsif arg == '-r'
    $find_rb = true
  elsif arg == '-e'
    $find_erb = true
  elsif arg == '-a'
    $find_text = true
    $find_source = true
    $find_header = true
    $find_rb = true
    $find_erb = true
  end
end

$target_str = ARGV.last.to_s
$current_path = Dir.pwd


locate_types = []
locate_types += ['.erb'] if $find_erb
locate_types += ['.rb', '.rake', '.cap'] if $find_rb
locate_types += ['.h', '.hh', '.hxx', '.hpp'] if $find_header
locate_types += ['.c', '.cc', '.cpp', '.cxx', '.mm', '.m'] if $find_source
locate_types += ['.haml', '.js', '.css', '.yml', '.html', '.md', '.scss', '.txt'] if $find_text #一些界面文件的类型可以自行加入

GrepMatchedItem = Struct.new(:lidx, :cont)

def scanfile (filename)
  matched = []
  open(filename) do |file|
    cont = file.read
    lidx = 1
    cont.each_line do |line|
      if line.include?($target_str)
        matched << GrepMatchedItem.new(lidx, line)
      end
      lidx += 1
    end
  end
  if not matched.empty?
    puts filename
    matched.each do |s|
      lead = sprintf("%10d: ", s.lidx)
      if STDOUT.tty? 
        cont = s.cont.gsub($target_str, "\033[1;31m\\&\033[m")
      else
        cont = s.cont
      end
      puts lead + cont
    end
  end
end


Find.find(Dir.pwd) do |item|
  if (locate_types.include?(File.extname(item)))
    scanfile(item)
  end
end
