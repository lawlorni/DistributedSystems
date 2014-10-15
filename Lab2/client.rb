#client socket program that sends string to server through socket
#and displays returned modified string

require 'socket'      # Sockets are in standard library

hostname = 'localhost'
port = 19999
s = TCPSocket.open(hostname, port) #create socket
 
puts "Enter sentence to be capitalised"  
  STDOUT.flush   
  sentence = gets.chomp   #read in from user
  s.puts sentence		  #send sentence to socket
  
 while line = s.gets       # Read lwhile there is 
  							# something to be read
   puts line      			#display what server has returned
  end

s.close                     # close socket