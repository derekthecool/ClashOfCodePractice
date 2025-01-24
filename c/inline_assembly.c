#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

main()
{
    int N;
    scanf("%d", &N);
    for (int i = 0; i < N; i++) {
        char word[21];
        scanf("%s", word);
        int sum = 0;

        fprintf(stderr, "word: %s\n",word);
        // Assembly to increment each character in the string until null terminator
        asm volatile (
            "mov %1, %%rsi;"         // Move the address of the string into rsi (pointer to the string)
            "start:"
            "movb (%%rsi), %%al;"    // Load the byte (character) at the address pointed by rsi into al
            // "add $1, %0;"
            "inc %0;"
            "test %%al, %%al;"       // Test if the character is the null terminator (end of string)
            "jz end;"                // If it's null terminator, jump to the end
            "inc %%al;"              // Increment the value in al (the character)
            "movb %%al, (%%rsi);"    // Store the incremented value back into the string at the current position
            "inc %%rsi;"             // Move the pointer to the next character in the string
            "jmp start;"             // Jump back to the start of the loop
            "end:"
            : "=r"(sum)
            : "r"(word)  // Input: address of the string
            : "%memory", "%rsi", "%al"  // Clobber memory, rsi (pointer), and al (accumulator register)
        );
        fprintf(stderr, "word after: %s, sum: %d\n",word, sum);
    }
}
