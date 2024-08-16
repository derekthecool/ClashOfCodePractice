def A():
   return map(int,input().split())

s = map(lambda x:x,zip(A(),A()))
print(list(s))
