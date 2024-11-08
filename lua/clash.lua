x=io.read
a,b,c=x'n',x'n',{}for i=a,b do c[#c+1]=i if i%3==0 or tostring(i):find('3')then
c[#c]='Dope'end end
print(table.concat(c,'-'))
