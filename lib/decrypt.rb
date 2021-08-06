require './lib/enigma'

if ARGV[0..1] != ['encrypted.txt', 'decrypted.txt']
  puts "Please enter file names with the following format:\n
         encrypted.txt decrypted.txt"
else
   message = File.read(ARGV[0]).chomp
end

key = '54728'
date = '231230'

enigma = Enigma.new
enigma.decrypt(message, key, date)

decrypted = File.open('decrypted.txt', 'w')
require 'pry'; binding.pry
decrypted.write(enigma.decrypted[:decryption])
decrypted.close

puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
