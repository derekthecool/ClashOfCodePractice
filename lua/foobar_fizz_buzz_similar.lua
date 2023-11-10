local function foobar()
    a.range(io.read('n'))
        :map(function(x)
            local output = ''
            if x % 5 == 0 == true then
                output = output .. 'Foo'
            end
            if x % 7 == 0 == true then
                output = output .. 'Bar'
            end
            if output == '' then
                output = tostring(x)
            end

            return output
        end)
        :each(print)
end
