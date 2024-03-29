-- Create any number of solutions here to test the code
local function testSolutions(input)
    -- Debug print the input here
    io.stderr:write(string.format('input:\n%s\n\n', input))

    -- Fill is table with as many solutions as possible.
    -- Each function should take one input which will be the string of all stdin
    -- lines from io.read('a')
    local solutions = {

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
