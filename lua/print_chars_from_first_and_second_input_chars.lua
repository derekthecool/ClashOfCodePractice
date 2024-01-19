local function print_chars_from_first_and_second_input_chars()
    o, t = io.read():match('(%d)(%d)')
    o = tonumber(o)
    t = tonumber(t)
    for i = 0, o - 1 do
        io.write('#')
    end
    for i = 0, t - 1 do
        io.write('*')
    end
    if o == 0 and t == 0 then
        print('Nothing Lol')
    end
end
