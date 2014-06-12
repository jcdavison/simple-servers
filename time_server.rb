require 'socket'

server = TCPServer.new(2000)

loop do
  # what is loop do ? 
  # how to figure out more about the TCPServer object ? 

  puts "Waiting for new clients on port #{server.addr[1]}..."

  client = server.accept
  client_ip_addr = client.addr[2]

  puts "[CONNECT] A client with IP address #{client_ip_addr} connected"
  puts ""

  client.puts "---"
  client.puts "Time: #{Time.now}"
  client.puts "---"

  client.close
end
