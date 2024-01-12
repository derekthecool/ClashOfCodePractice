function replace_odd_and_even_numbers_with_words() {
  console.log(
    readline().replace(new RegExp(/\d+/, 'g'), (match) =>
      match % 2 == 0 ? 'Buzz' : 'Lightning',
    ),
  )
}
