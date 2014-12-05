
require 'thread'
require 'socket'

class Pool


  def initialize(size)
 
    @size = size
    @jobs = Queue.new
    
  
    @pool = Array.new(@size) do |i|
      Thread.new do
        Thread.current[:id] = i

        catch(:exit) do
          
          loop do
           
            job, args = @jobs.pop
            job.call(*args)
          end
        end
      end
    end
  end
  

  def schedule(*args, &block)
   
    @jobs << [block, args]
  end
  

  def shutdown
    @size.times do
      schedule { throw :exit }
    end
    
    @pool.map(&:join)
  end
end

# Demonstration
# -------------
# Running this file will display how the thread pool works.
if $0 == __FILE__

 
port = 19999
  p = Pool.new(10)
  server = TCPServer.open(port)
  chatRooms = Hash.new;

  
  loop{
      p.schedule(server.accept) do |client|
        loop{
    sock_domain, remote_port, remote_hostname, remote_ip = client.peeraddr
    read =client.gets
    text ="HELO text\n" 
    kill ="KILL_SERVICE\n"

    sentences = Array.new
    #puts "array of split sentences"
    sentences =read.split(' ')
    
    #JOIN_CHATROOM:lawlor CLIENT_IP:0 PORT:0 CLIENT_NAME:lawlipops
if read ==kill
        modify = "Killing Server"
        client.puts modify
        client.close
        server.close
        end

    if sentences[0].include? "JOIN_CHATROOM"
        room = sentences[0]
        puts "Joining chat room:"
        room.slice! "JOIN_CHATROOM:"
        puts room
        

    end

    if sentences[1].include? "CLIENT_NAME"
        nickname = sentences[1]
        puts "user name: " 
        puts nickname
        nickname.slice! "CLIENT_NAME:"
        if (chatRooms[room])
          puts "names already in use"
        else
        chatRooms[room] = nickname,"Admin";
        end
        puts "contents of this chatroom"
        puts "#{chatRooms['hola']} \n"
    end




        #if read.include? "HELO"
   if read.include? "HELO"   #look for 
        modify = read <<"IP:#{remote_ip} Port : #{port} Student ID : 11368226 "
      # finalMessage =[read,modify].join(' ')
        client.puts modify
  else
       modify="not a valid command"
       client.puts modify
   
  end 
 #client.close                # Disconnect from the client
}

end
}
 at_exit { p.shutdown }
end


