require 'socket'

server = TCPServer.new(2000)

# An "echo server" read a single line of input from the client, echoes that
# input line back to the client, hangs up, and listens for a new connection.

loop do
  puts "Waiting for new clients on port #{server.addr[1]}..."
  client = server.accept
  client_ip_addr = client.addr[2]
  message = client.gets
  client.puts message
  client.close
end
