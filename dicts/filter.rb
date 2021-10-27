File.open("dict.txt","w") do |file| 
    ['danhtu.txt','dongtu.txt','tinhtu.txt'].each do |path|
        f = File.open(path)
        while !f.eof? 
            word = f.gets.chomp#.split(' ')
            if word.size <= 10
                word = word.split(' ')
                if word.size == 2
                    file.puts(word.join(' '))
                end
            end
        end
    end
end