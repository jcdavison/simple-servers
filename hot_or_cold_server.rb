require 'socket'

server = TCPServer.new(2000)

# See the "hot_or_cold" kata from Week 1.
# This is a server version of that kata.

def guess_again 
  "Please guess again."
end

loop do
  number_to_guess = rand(10000)

  puts "Waiting for new clients on port #{server.addr[1]}..."

  client = server.accept
  client.puts "Welcome to hot or cold.\n"
  client.puts "What is your guess?\n"
  client_ip_addr = client.addr[2]
 
  while client
    guess = client.gets.to_i
    if guess > number_to_guess
      client.puts "You are running a little hot."
      client.puts guess_again
    elsif guess == number_to_guess
      client.puts "Nice you guessed #{number_to_guess} correctly."
      client.puts "Thank you drive through."
      client.close
    elsif guess < number_to_guess
      client.puts "Brrrrr, it is cold in here."
      client.puts guess_again
    end
  end

end
