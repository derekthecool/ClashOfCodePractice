function reverse_map_numbers() {
  const N = parseInt(readline())
  const lookup = {
    0: 9,
    1: 8,
    2: 7,
    3: 6,
    4: 5,
    5: 4,
    6: 3,
    7: 2,
    8: 1,
    9: 0,
  }
  for (let i = 0; i < N; i++) {
    console.log(lookup[readline()])
  }
}
