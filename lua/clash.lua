io.read()

output = {}

for user in io.lines() do
    io.stderr:write(string.format('%s\n', user))
    if user:lower():match('anonymous') or select(2, user:gsub('_', '')) > 1 or user:match('[^a-zA-Z0-9_]') then
        table.insert(output, user)
    end
end

if next(output) then
    print(table.concat(output, ' '))
else
    print('Cleared')
end
