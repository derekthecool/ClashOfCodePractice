local previous = ''
for word in io.read():gmatch('.') do
    if word ~= previous then
        io.write(word)
        previous = word
    end
end
