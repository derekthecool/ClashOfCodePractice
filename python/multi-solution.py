import sys

# Read all stdin lines
lines = sys.stdin.read().splitlines()

# Fill this dictionary with as many solutions as possible
solutions = {
    "firstSolution": lambda: len(lines) + 5,
    "secondSolution": lambda: len(lines),
}

results = {name: func() for name, func in solutions.items()}
all_match = len(set(results.values())) == 1

for name, result in results.items():
    sys.stderr.write(f"Function {name} result: {result}\n")

sys.stderr.write(
    "All solutions match! Printing result to stdout.\n"
    if all_match
    else "There was a discrepancy between solutions.\n"
)

# If all solutions match print one of them to stdout
if all_match:
    print(next(iter(results.values())))
