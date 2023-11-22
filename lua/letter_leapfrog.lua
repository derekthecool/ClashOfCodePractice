local function letter_leapfrog()
    i = io.read()
    s = i
    for I = 1, #i do
        s = (s:gsub('(.)(.*)', '%2%1'))
        print(s)
    end
end
