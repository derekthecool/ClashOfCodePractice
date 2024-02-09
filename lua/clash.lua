n = tonumber(io.read())
for i = 1, n do
    if i%2~=0 then
        o = (o or nil) + i
    end
end
print(o)

