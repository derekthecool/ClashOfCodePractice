local function minutes_to_formatted_time()
    number = io.read('n')
    print(string.format('%dh %dm', number // 60, number % 60))
end
