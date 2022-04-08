file_name = ARGV[0]

maze = File.readlines(file_name).map do |line|
  line.chomp.split('')
end

p maze
