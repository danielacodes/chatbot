require 'socket'

server = 'irc.freenode.net'
port = 6667
socket = TCPSocket.open(server,port)

nickname = 'SkillcrushBotOMG'
channel = '#tobiobi'

socket.puts "NICK #{nickname}"
socket.puts "USER #{nickname} 0 * #{nickname}"
socket.puts "JOIN #{channel}"

socket.puts "PRIVMSG #{channel} :I am so happy to be here!"

while message = socket.gets do
  puts message

  if message.match('^PING :')
    server = message.split(':').last
    puts "PONG #{server}"
    socket.puts "PONG #{server}"
  elsif message.match('How are you?')
    puts "PRIVMSG #{channel} :I'm great. Thanks. How are you?"
    socket.puts "PRIVMSG #{channel} :I'm great. Thanks. How are you?"
  elsif message.match('What is your name?')
    puts "PRIVMSG #{channel} :I'm Daniela. And you?"
    socket.puts "PRIVMSG #{channel} :I'm Daniela. And you?"
  elsif message.match('It is nice to meet you :D')
    puts "PRIVMSG #{channel} :Nice to meet you too!"
    socket.puts "PRIVMSG #{channel} :Nice to meet you too!"
  end
end
