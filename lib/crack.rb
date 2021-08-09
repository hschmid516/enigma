require './lib/enigma'

if ARGV[0..1] != ['encrypted.txt', 'cracked.txt'] ||
  ARGV[2].class != Integer && ARGV[2].to_s.length !=6
  puts "Please enter file names and date with the following format:\n
    encrypted.txt cracked.txt <DDMMYY>"
else
   message = File.read(ARGV[0]).chomp
   date = ARGV[2].to_s

   enigma = Enigma.new
   cracked_hash = enigma.crack(message, date)

   cracked = File.open('cracked.txt', 'w')
   cracked.write(cracked_hash[:decryption])
   cracked.close

   puts "Created 'cracked.txt' with the key: #{cracked_hash[:key]}, and date: #{cracked_hash[:date]}"
end
