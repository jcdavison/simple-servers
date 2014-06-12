require 'socket'
# require '../../zip-zap-zop/zip.rb'
require 'zipzapzop'
server = TCPServer.new(2000)

def play_game(client, game)
  client.puts "Please enter previous commands." 
  client.puts "zip, zap, zop - comma separated, no braces/brackets"
  commands = client.gets.chomp.split(/,\s*/)
  commands = commands.collect {|command| command.gsub(/[^a-zA-Z]*/,"")}
  client.puts "Please enter your new command."
  command = client.gets.chomp
  client.puts "Please enter the next person."
  person = client.gets.chomp
  game.pass(commands, command, person)
end

def display_messages(client, game)
  50.times { client.puts "ZIP ZAP ZOP" }
  game.messages.each {|message| client.puts message + "\n"}
end

loop do
  client = server.accept
  client.puts "Welcome to my little game."
  game = ZipZapZop::ZipZapZop.new
  while game.in_progress?
    play_game(client, game)
    display_messages(client, game)
  end
  display_messages(client, game)
  client.close
  puts "GAME OVER"
  exit
end

