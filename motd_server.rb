require 'socket'

server = TCPServer.new(2000)


loop do
  client = server.accept
  message = File.read("motd.txt")
  client.puts message
  client.close
end
