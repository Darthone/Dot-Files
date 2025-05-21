#!/usr/bin/env python3
"""
CSV to JSON Converter

A script that converts CSV data to JSON format.
Handles various CSV formats and provides options for the JSON output structure.
"""

import argparse
import csv
import json
import sys
import os

def csv_to_json(csv_file_path, output_file=None, pretty=False, array_of_objects=True, 
                named_objects=False, key_field=None, delimiter=','):
    """
    Convert a CSV file to JSON format.
    
    Args:
        csv_file_path (str): Path to the input CSV file
        output_file (str, optional): Path to the output JSON file. If None, prints to stdout.
        pretty (bool): Whether to format the JSON output with indentation
        array_of_objects (bool): If True, creates an array of objects with field names as keys
        named_objects (bool): If True, creates objects named by the value in key_field
        key_field (str, optional): Field to use as the key for named objects
        delimiter (str): CSV delimiter character
    
    Returns:
        None
    """
    try:
        with open(csv_file_path, 'r', encoding='utf-8') as csv_file:
            # Try to detect the dialect
            try:
                dialect = csv.Sniffer().sniff(csv_file.read(4096))
                csv_file.seek(0)
            except csv.Error:
                # If dialect detection fails, use the provided delimiter
                dialect = csv.excel
                dialect.delimiter = delimiter
            
            csv_reader = csv.DictReader(csv_file, dialect=dialect)
            
            # Convert CSV to JSON based on selected format
            if named_objects and key_field:
                # Format: {key1: {fields}, key2: {fields}, ...}
                json_data = {}
                for row in csv_reader:
                    if key_field in row:
                        key = row[key_field]
                        json_data[key] = row
                    else:
                        print(f"Warning: Key field '{key_field}' not found in CSV", file=sys.stderr)
                        json_data = [row for row in csv_reader]  # Fallback to array of objects
                        break
            else:
                # Format: [{fields}, {fields}, ...]
                json_data = [row for row in csv_reader]
        
        # Determine indentation for JSON output
        indent = 4 if pretty else None
        
        # Output the JSON data
        if output_file:
            with open(output_file, 'w', encoding='utf-8') as json_file:
                json.dump(json_data, json_file, indent=indent)
            print(f"Conversion complete! JSON saved to {output_file}")
        else:
            print(json.dumps(json_data, indent=indent))
            
    except FileNotFoundError:
        print(f"Error: File '{csv_file_path}' not found.", file=sys.stderr)
        sys.exit(1)
    except PermissionError:
        print(f"Error: Permission denied when accessing '{csv_file_path}'.", file=sys.stderr)
        sys.exit(1)
    except json.JSONDecodeError:
        print("Error: Failed to encode data to JSON.", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error: {str(e)}", file=sys.stderr)
        sys.exit(1)

def main():
    parser = argparse.ArgumentParser(description="Convert CSV data to JSON format.")
    parser.add_argument("input_file", help="Path to the input CSV file")
    parser.add_argument("-o", "--output", help="Path to the output JSON file. If not specified, prints to stdout")
    parser.add_argument("-p", "--pretty", action="store_true", help="Format the JSON output with indentation")
    parser.add_argument("-d", "--delimiter", default=',', help="CSV delimiter character (default: ',')")
    
    format_group = parser.add_argument_group("Output Format Options")
    format_group.add_argument("-n", "--named-objects", action="store_true", 
                             help="Create objects named by the value in the key field")
    format_group.add_argument("-k", "--key-field", 
                             help="Field to use as the key when using --named-objects")
    
    args = parser.parse_args()
    
    # Validate arguments
    if args.named_objects and not args.key_field:
        parser.error("--named-objects requires --key-field to be specified")
    
    csv_to_json(
        args.input_file,
        output_file=args.output,
        pretty=args.pretty,
        array_of_objects=True,
        named_objects=args.named_objects,
        key_field=args.key_field,
        delimiter=args.delimiter
    )

if __name__ == "__main__":
    main()
