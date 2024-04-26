-- Create any number of solutions here to test the code
local function testSolutions(input)
    -- Debug print the input here
    local print_input = input
    if INDEXED_INPUT then
        print_input = table.concat(input, '\n')
    end

    io.stderr:write(string.format('input:\n%s\n\n', print_input))

    -- Fill is table with as many solutions as possible.
    -- Each function should take one input which will be the string of all stdin
    -- lines from io.read('a')
    local solutions = {
        function(a)
            local number = 1
            for i = 1, tonumber(a) do
                number = number * i
            end
            return number
        end,

        function(a)
            local function factorial(n)
                if n == 0 then
                    return 1
                else
                    return n * factorial(n - 1)
                end
            end

            return factorial(tonumber(a))
        end,

        function(a)
            local function factorial(n)
                if n == 0 then
                    return 1
                else
                    return n * factorial(n - 1)
                end
            end

            local fact = {tonumber(a)}
            local factMetatable = {
                -- unm  == unary minus
                __unm = function(t)
                    return factorial(t[1])
                end,
            }

            -- Set the metatable
            setmetatable(fact, factMetatable)

            -- Call the function from the metatable by running the unary minus operator
            return -fact
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

-- Choose with this boolean if you want to read input into a table or as a
-- single string
INDEXED_INPUT = false

local lines = io.read('a')
if indexed_input then
    lines = {}
    for line in io.lines() do
        table.insert(lines, line)
    end
end

testSolutions(lines)
