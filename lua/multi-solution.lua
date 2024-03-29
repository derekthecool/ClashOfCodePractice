-- Create any number of solutions here to test the code
local function testSolutions(input)
    io.stderr:write(string.format('input:\n%s\n', input))
    local solutions = {
        function(x)
            local S = 0
            local b
            for a in x:gmatch('.') do
                if not b then
                    b = a
                elseif a ~= b then
                    S = S + 1
                    b = a
                end
            end
            return S
        end,

        function(x)
            local changes = 0
            local lastDigit = x:sub(1, 1)

            for digit in x:gmatch('(%d)') do
                if digit ~= lastDigit then
                    changes = changes + 1
                    lastDigit = digit
                end
            end

            return changes
        end,
    }

    -- Variable to store the expected result (initially nil)
    local expectedResult = nil
    local allMatch = true -- Flag to check if all solutions match

    for name, func in pairs(solutions) do
        local result = func(input)
        io.stderr:write(string.format('Function %s result: %s\n', name, result))

        if expectedResult == nil then
            expectedResult = result
        elseif expectedResult ~= result then
            allMatch = false
            io.stderr:write(name, 'does not match the expected result:', expectedResult, '\n')
            break
        end
    end

    -- If all solutions match print the result
    if allMatch then
        io.stderr:write('All solutions match.\n')
        print(expectedResult)
    else
        io.stderr:write('There was a discrepancy between solutions.\n')
    end
end

-- Run input through the multi-solution test runner
testSolutions(io.read('a'))
