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

quotes = ["It is during our darkest moments that we must focus to see the light. - Aristotle", "The way get started is to quit talking and being doing. - Walt Disney", "The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty. - Winston Churchill"]

while message = socket.gets do
  puts message

  if message.match('^PING :')
    server = message.split(':').last
    puts "PONG #{server}"
    socket.puts "PONG #{server}"
  elsif message.match('Oh Bot, I feel down. Inspire me!')
    puts "PRIVMSG #{channel} :#{quotes.sample(1)}"
    socket.puts "PRIVMSG #{channel} :#{quotes.sample(1)}"
  elsif message.match('How are you?')
    puts "PRIVMSG #{channel} :I'm great. Thanks. How are you?"
    socket.puts "PRIVMSG #{channel} :I'm great. Thanks. How are you?"
  elsif message.match('What is your name?')
    puts "PRIVMSG #{channel} :I'm Daniela. And you?"
    socket.puts "PRIVMSG #{channel} :I'm Daniela. And you?"
  elsif message.match('It is nice to meet you :D')
    puts "PRIVMSG #{channel} :Nice to meet you too!"
    socket.puts "PRIVMSG #{channel} :Nice to meet you too!"
  elsif message.match('I want to be your BFF!')
    puts "PRIVMSG #{channel} :I want to be yours too"
    socket.puts "PRIVMSG #{channel} :I want to be yours too"
    File.write('brain.txt', "Daniela")
  elsif message.match('Who is your BFF?')
    BFF = File.read('brain.txt')
    puts "PRIVMSG #{channel} :#{BFF}"
    socket.puts "PRIVMSG #{channel} :#{BFF}"
  end
end
