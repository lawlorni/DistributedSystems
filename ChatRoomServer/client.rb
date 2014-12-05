#client socket program that sends string to server through socket
#and displays returned modified string

require 'socket'      # Sockets are in standard library

hostname = 'localhost'
port = 19999
s = TCPSocket.open(hostname, port) #create socket
 
 loop{
puts "Enter sentence to send to server"  
  STDOUT.flush   
  sentence = gets.chomp   #read in from user
  s.puts sentence		  #send sentence to socket
  
  
 line = s.gets       # Read lwhile there is 
   puts line      			#display what server has returned
}
s.close                     # close socket

