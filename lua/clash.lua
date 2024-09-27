line = io.read()

midpoint = #line // 2
io.stderr:write(string.format('input: %s\n', line))
io.stderr:write(string.format('midpoint: %d\n', midpoint))
io.stderr:write(string.format('length: %d\n', #line))

if #line % 2 == 0 then
    print(line:sub(midpoint + 1, #line) .. line:sub(1, midpoint))
else
    first = line:sub(midpoint + 2, #line)
    second = line:sub(1, midpoint + 1)
    io.stderr:write(string.format('first: %s\n', first))
    io.stderr:write(string.format('second: %s\n', second))
    print(first .. second)
end
