local function mapping_numbers()
    N = tonumber
    io.read('a'):gsub('(%d+) (%d+)', function(s, t)
        print(math.floor((N(s) * N(t) * 0.6)))
    end)
end
