import re
print(*(map(len,list(re.findall(r'\S+',input())))))
