require 'resque'
require 'resque_scheduler'
require 'resque/scheduler'
require 'active_support/core_ext/numeric/time'
require 'host'
require 'array'
require "workers/log_parser"

class Parser
  def start(path, connected_to, connected_from)
    Resque.enqueue_in 1.second, LogParser, path + " " + connected_to + " " + connected_from
  end
end