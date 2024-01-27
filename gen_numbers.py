#!/usr/bin/python3

import random
import sys

def generate_numbers(N_in_S , N, range_start, range_end, quote):
    for _ in range(N):
        numbers = random.sample(range(range_start, range_end + 1), N_in_S)
        print(quote + ' '.join(map(str, numbers)) + quote)

def main():
    if len(sys.argv) != 5 and len(sys.argv) != 6:
        print("Usage: python script.py <number_in_string> <number_of_strings> <range_start> <range_end> <quote>")
        sys.exit(1)

    N_in_S = int(sys.argv[1])
    N = int(sys.argv[2])
    range_start = int(sys.argv[3])
    range_end = int(sys.argv[4])
    quote = sys.argv[5] if len(sys.argv) > 5 else ""

    generate_numbers(N_in_S, N, range_start, range_end, quote)

if __name__ == "__main__":
    main()
