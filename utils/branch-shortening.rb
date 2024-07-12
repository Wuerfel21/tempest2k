

log = `./rmac/rmac -s -l*yak.lst -fb -isrc -DPROPELLER src/yak.s -o bin_p2/yak.cof`

#p log

source = File.read("./src/yak.s").lines

#p lines

processed = 0
log.lines.each do |line|
    if line =~ /^src\/yak.s (\d+): Warning: unoptimized short branch/
        source[$1.to_i - 1].sub!(/(?<=\s)(b\w{2})(?=\s)/,'\1.s')
        processed += 1
    end
end

File.write("./src/yak.s",source.join)
puts "Processed #{processed} branches"