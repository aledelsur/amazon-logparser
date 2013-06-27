class Host

  def initialize(log, connected_to, connections_from)
    @log = log
    @connected_to = connected_to
    @connections_from = connections_from
  end

  def hosts_connected_to
    output = [] 
    File.open(@log, "r").each_line do |line|
      record = line.split(" ")
      connected_to = record[2].strip if record[2]
      connected_from = record[1].strip if record[1]
      output << connected_from if connected_to == @connected_to.strip
    end
    output
  end

  def hosts_received_connections_from
    output = []
    File.open(@log, "r").each_line do |line|
      record = line.split(" ")
      connected_to = record[2].strip if record[2]
      connected_from = record[1].strip if record[1]
      output << connected_to if connected_from == @connections_from.strip
    end
    output
  end

  def hosts_with_most_connections
    hosts_generating_connections = []
    File.open(@log, "r").each_line do |line|
      record = line.split(" ")[1].strip
      hosts_generating_connections << record
    end
    hosts_generating_connections.most_repeated
  end

end
