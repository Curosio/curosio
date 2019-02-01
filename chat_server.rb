require "/usr/lib/ruby/2.3.0/gems/web_socket_chat_server-0.0.9/lib/web_socket_chat_server.rb"

admin1 = WebSocketChatServer::ChatUser.new(:username => "admin", :password => "secret")
admin2 = WebSocketChatServer::ChatUser.new(:username => "admin2", :password => "secret2")
admins = []
admins << admin1
admins << admin2

chat = WebSocketChatServer::ChatServer.new(:host=> "195.24.66.24", :port => "8888", :admins => admins)

chat.start_server do |response|
puts response
end

['TERM', 'INT'].each do |signal|
trap(signal){ 
chat.stop_server()
}
end

puts "Running..........."
wait = gets