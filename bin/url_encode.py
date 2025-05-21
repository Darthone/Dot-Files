#!/usr/bin/env python3
"""
A simple URL encoder script.

This script provides both a command-line interface and an interactive mode
to encode URLs or URL components according to URL encoding standards.
"""

import argparse
import urllib.parse
import sys

def encode_url(url):
    """
    Encode a URL or URL component according to URL encoding standards.
    
    Args:
        url (str): The URL or URL component to encode
        
    Returns:
        str: The encoded URL
    """
    return urllib.parse.quote(url, safe='')

def encode_url_component(url):
    """
    Encode a URL component, allowing some characters to remain unencoded.
    
    Args:
        url (str): The URL to encode
        
    Returns:
        str: The encoded URL with safe characters preserved
    """
    # Default safe characters: '/', '?', ':', '@', '&', '=', '+', '$', ',', ';', '#'
    return urllib.parse.quote(url)

def main():
    parser = argparse.ArgumentParser(description="Encode URLs or URL components.")
    parser.add_argument("url", nargs="?", type=str, help="The URL to encode")
    parser.add_argument("-c", "--component", action="store_true", 
                        help="Encode as URL component (preserves some special characters)")
    parser.add_argument("-i", "--interactive", action="store_true", 
                        help="Run in interactive mode")
    args = parser.parse_args()
    
    if args.interactive:
        print("URL Encoder (interactive mode)")
        print("Type 'exit' or 'quit' to exit")
        print("Prefix with 'c:' to encode as component (preserves some special characters)")
        print("Enter URLs below:")
        
        while True:
            try:
                user_input = input("> ")
                if user_input.lower() in ["exit", "quit"]:
                    break
                
                if user_input.startswith("c:"):
                    url = user_input[2:].strip()
                    encoded = encode_url_component(url)
                    print(f"Encoded as component: {encoded}")
                else:
                    encoded = encode_url(user_input)
                    print(f"Fully encoded: {encoded}")
                    
            except KeyboardInterrupt:
                print("\nExiting...")
                break
    
    elif args.url is not None:
        if args.component:
            encoded = encode_url_component(args.url)
        else:
            encoded = encode_url(args.url)
        print(encoded)
    
    else:
        parser.print_help()

if __name__ == "__main__":
    main()
