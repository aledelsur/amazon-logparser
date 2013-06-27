require "host"
require "array"

describe Host do
  before :each do
    @host = Host.new("#{File.dirname(__FILE__)}/log.txt", "garak", "ale")
  end

  it "should return the expected list of hostnames connected to a given (configurable) host " do
    hostnames = @host.hosts_connected_to
    hostnames.should eq(["ale", "lilac"])
  end

  it "should return the expected list of hostnames received connections from a given (configurable) host" do
    hostnames = @host.hosts_received_connections_from
    hostnames.should eq(["garak", "lilac"])
  end

  it "should return the hostname that generated most connections in the last hour" do
    hostname = @host.hosts_with_most_connections
    hostname.should eq("ale")
  end
end
