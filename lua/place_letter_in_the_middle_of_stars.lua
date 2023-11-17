local function place_letter_in_middle_of_stars()
    l = io.read()
    n = io.read('n')

    if n % 2 == 0 then
        print('CAN\'T')
    else
        stars = string.rep('*', n // 2)
        print(string.format('%s%s%s', stars, l, stars))
    end
end
