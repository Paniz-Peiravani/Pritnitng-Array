# Printing an Array of Integers in MIPS Assembly

This MIPS assembly code demonstrates how to declare, initialize, and sort an array of integers. The code is designed to:

1. Initialize an array of integers in the Data Segment.
2. Sort the array using a simple bubble sort algorithm.

## Code Explanation

- The `.data` section defines an array `intArray` of size 10 to store integers.
- Integers are added to the array using `sw` instructions.
- The sorting algorithm is a simple bubble sort implemented with nested loops.
- The outer loop (`outterLoop`) iterates until no swaps are needed, indicating the array is sorted.
- The inner loop (`innerLoop`) compares adjacent elements and swaps them if necessary.
- The array address is incremented by 4 bytes in each iteration to move to the next element.
- The code concludes by printing the sorted array.

