
require 'socket'               
require 'threadpool'

port = 19999
server = TCPServer.open(port)  # Socket to listen on port 19999
loop {                          # Server run forever until closed externally
  Thread.fork(server.accept) do |client|
    #get domain port
  	sock_domain, remote_port, remote_hostname, remote_ip = client.peeraddr
    read =client.gets
    text ="HELO text\n" 
    kill ="KILL_SERVICE\n"
    
if read ==kill
        modify = "Killing Server"
        client.puts modify
        client.close
        server.close
        end
   if read==text   #look for 
        modify = "HELO text IP: #{remote_ip} Port : #{port} Student ID : 11368226 "
        client.puts modify
   else
 	      modify=read.upcase()
        client.puts modify
    end
    
 client.close                # Disconnect from the client
end


}
