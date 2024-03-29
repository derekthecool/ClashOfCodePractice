-- Create any number of solutions here to test the code
local function testSolutions(input)
    local solutions = {
        basicSolution = function(x)
            local product, sum = 1, 0
            for i = 1, x do
                product = product * i
                sum = sum + i
            end
            return product + sum
        end,

        -- fancyPantsMathSolution = function(x)
        --     local sum = (x * (x + 1)) / 2
        --
        --     -- Boo-hoo there is no awesome formula without looping or recursion
        --     -- for factorials. Use this instead
        --     local factorialTable = {
        --         1, -- 0!
        --         1, -- 1!
        --         2, -- 2!
        --         6, -- 3!
        --         24, -- 4!
        --         120, -- 5!
        --         720, -- 6!
        --         5040, -- 7!
        --         40320, -- 8!
        --         362880, -- 9!
        --         3628800, -- 10!
        --         39916800, -- 11!
        --         479001600, -- 12!
        --         6227020800, -- 13!
        --         87178291200, -- 14!
        --         1307674368000, -- 15!
        --         20922789888000, -- 16!
        --         355687428096000, -- 17!
        --         6402373705728000, -- 18!
        --         121645100408832000, -- 19!
        --         2432902008176640000, -- 20!
        --         51090942171709440000, -- 21!
        --         1124000727777607680000, -- 22!
        --         25852016738884976640000, -- 23!
        --         620448401733239439360000, -- 24!
        --         15511210043330985984000000, -- 25!
        --     }
        --
        --     local product = factorialTable[x]
        --
        --     return sum + product
        -- end,
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
