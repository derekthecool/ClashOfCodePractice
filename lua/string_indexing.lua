local function string_indexing_1()
    -- Read a string input and then a list of numbers. Index into the string the numbers
    io.read()
    s = io.read()
    io.read():gsub('%d', function(a)
        b = tonumber(a)
        io.write(s:sub(a, a))
    end)
end
