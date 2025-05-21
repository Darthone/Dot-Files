#!/usr/bin/env python3
"""
A simple command-line tool to convert decimal numbers to binary.
"""

import argparse
import sys

def decimal_to_binary(decimal):
    """Convert a decimal number to its binary representation."""
    if decimal == 0:
        return "0"
    
    # Handle negative numbers
    is_negative = decimal < 0
    if is_negative:
        decimal = abs(decimal)
    
    binary = ""
    while decimal > 0:
        binary = str(decimal % 2) + binary
        decimal //= 2
    
    return binary

def main():
    parser = argparse.ArgumentParser(description="Convert decimal numbers to binary.")
    parser.add_argument("number", nargs="?", type=int, help="The decimal number to convert to binary")
    parser.add_argument("-i", "--interactive", action="store_true", help="Run in interactive mode")
    args = parser.parse_args()
    
    if args.interactive:
        print("Decimal to Binary Converter (interactive mode)")
        print("Type 'exit' or 'quit' to exit")
        print("Enter decimal numbers below:")
        
        while True:
            try:
                user_input = input("> ")
                if user_input.lower() in ["exit", "quit"]:
                    break
                    
                decimal = int(user_input)
                binary = decimal_to_binary(decimal)
                print(f"Binary: {binary}")
                
            except ValueError:
                print("Please enter a valid integer")
            except KeyboardInterrupt:
                print("\nExiting...")
                break
    
    elif args.number is not None:
        binary = decimal_to_binary(args.number)
        print(binary)
    
    else:
        parser.print_help()

if __name__ == "__main__":
    main()
