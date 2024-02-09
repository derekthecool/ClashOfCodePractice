# most important line of ALL!
import re

input = input()

realVowelCount = len(re.findall(r'[aeiou]', input.lower()))

for i in range(realVowelCount):
    print(input)

if realVowelCount == 0:
    print('NONE')
