#!/usr/bin/env ruby
Dir.chdir(File.dirname(__FILE__))
puts ARGV
def usage()
  puts "Oh no! Need some options"
  puts "usage: ruby #{__FILE__} [OPTS] filter"
  puts " OPTS: -s|--server IP"
  puts "example: ruby #{__FILE__} --server 10.160.224.1 \"^filter.*\""
  exit 1
end

if ARGV.length == 0
  usage
end

server_opt = false
ARGV.each do |arg|
  if server_opt
    server_ip = arg
    server_opt = false
    next
  end
  case arg
  when "--server|-s"
    server_opt = true
  else
    jobs_to_filter = arg
  end
end

if jobs_to_filter == ""
  puts "no filter for the jobs"
  usage
end

