h,m,s,PM = io.read():match('(%d+):(%d+):(%d+)(..)')
h = tonumber(h)
m = tonumber(m)
s = tonumber(s)
io.stderr:write(string.format("%d,%d,%d, %s\n",h,m,s,PM))
if PM == "PM" and h ~= 12 then
    h = h + 12
end
io.stderr:write(string.format("%d,%d,%d, %s\n",h,m,s,PM))

print(string.format("%02d:%02d:%02d",h,m,s))
