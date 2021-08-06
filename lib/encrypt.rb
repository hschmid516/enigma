require './lib/enigma'

if ARGV != ['message.txt', 'encrypted.txt']
  puts "Please enter file names with the following format:\n
         message.txt encrypted.txt"
else
   message = File.read(ARGV[0]).chomp
   key = '54728'
   date = '231230'

   enigma = Enigma.new
   enigma.encrypt(message, key, date)

   encrypted = File.open('encrypted.txt', 'w')
   encrypted.write(enigma.encrypted[:encryption])
   encrypted.close

   puts "Created 'encrypted.txt' with the key #{key} and date #{date}"
end
