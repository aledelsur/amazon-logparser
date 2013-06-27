require 'resque'
require 'resque_scheduler'
require 'resque/scheduler'
require 'active_support/core_ext/numeric/time'
require 'host'
require 'array'
require "workers/log_parser"

class LogParser
  @queue = :parser_queue
  
  def self.perform(string)
    array = string.split(" ")
    host = Host.new(array[0], array[1], array[2])
    File.open("out.txt", 'w') {|f| f.write("Hosts connected to #{array[2]}: "+ host.hosts_connected_to.inspect + " | Hosts received connections from #{array[1]}: " + host.hosts_received_connections_from.inspect + " | Host with most connections: " + host.hosts_with_most_connections) }
    Resque.enqueue_in 1.hour, LogParser, string
  end
end