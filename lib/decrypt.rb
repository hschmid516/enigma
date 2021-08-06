require './lib/enigma'

if ARGV[0..1] != ['encrypted.txt', 'decrypted.txt'] ||
  ARGV[2].class != Integer && ARGV[2].to_s.length !=5 ||
  ARGV[3].class != Integer && ARGV[3].to_s.length !=6
  puts "Please enter file names, key, and date with the following format:\n
    encrypted.txt decrypted.txt <5-digit key> <DDMMYY>"
else
   message = File.read(ARGV[0]).chomp
   key = ARGV[2].to_s
   date = ARGV[3].to_s

   enigma = Enigma.new
   enigma.decrypt(message, key, date)

   decrypted = File.open('decrypted.txt', 'w')
   decrypted.write(enigma.decrypted[:decryption])
   decrypted.close

   puts "Created 'decrypted.txt' with the key: #{key}, and date: #{date}"
end
