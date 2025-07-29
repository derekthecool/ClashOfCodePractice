local function place_letter_in_middle_of_stars()
    l = io.read()
    X = io.read('n')

    if X % 2 == 0 then
        print('CAN\'T')
    else
        stars = string.rep('*', X // 2)
        print(string.format('%s%s%s', stars, l, stars))
    end
end
