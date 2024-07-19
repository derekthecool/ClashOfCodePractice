io.read()
local all_but_the_last, last = io.read():match('(.*) (%d+)')

-- print((io.read():gsub('(%s*%d+%s*)',function(a)
--     local number = tonumber(a)
--     local dots = string.rep('.', number)
--     return string.format("%d%s",number, dots)
-- end)))

io.stdout:write((all_but_the_last:gsub('(%s*%d+%s*)', function(a)
    local number = tonumber(a)
    local dots = string.rep('.', number)
    return string.format('%d%s', number, dots)
end))
)

io.stdout:write(last)
