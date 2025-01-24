#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
    // Declare a writable string (mutable character array)
    char string[] = "123456789";

    // Assembly to increment each character in the string until null terminator
    asm volatile (
        "mov %0, %%rsi;"         // Move the address of the string into rsi (pointer to the string)
        "start:"
        "movb (%%rsi), %%al;"    // Load the byte (character) at the address pointed by rsi into al
        "test %%al, %%al;"       // Test if the character is the null terminator (end of string)
        "jz end;"                // If it's null terminator, jump to the end
        "inc %%al;"              // Increment the value in al (the character)
        "movb %%al, (%%rsi);"    // Store the incremented value back into the string at the current position
        "inc %%rsi;"             // Move the pointer to the next character in the string
        "jmp start;"             // Jump back to the start of the loop
        "end:"
        : // No output operands
        : "r"(string)  // Input: address of the string
        : "%memory", "%rsi", "%al"  // Clobber memory, rsi (pointer), and al (accumulator register)
    );

    // Print the modified string
    fprintf(stderr, "Modified string: [%s]\n", string);

    return 0;
}
