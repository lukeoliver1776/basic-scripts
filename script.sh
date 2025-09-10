#!/bin/bash

#Space removal utility
#Removes spaces from the beginning of file names in the inputted directory

echo "Welcome to SRU - Space Removal Utility"
echo "This utility removes spaces from the beginning of file names in the specified directory."
echo "Please enter the directory path:"
read dir_path

cd "$dir_path" || { echo "Entered directory does not exist...exiting"; exit 1; }

for file in *; do
    if [[ -e "$file" ]]; then
        new_name="$(echo "$file" | sed 's/^ *//')"
        if [[ "$file" != "$new_name" ]]; then
            mv "$file" "$new_name"
            echo "Renamed '$file' to '$new_name'"
        fi
    fi
done

echo "Space removal process completed."
echo "Would you like to remove trailing spaces as well? (y/n)"
read response
if [[ "$response" == "y" ]]; then
    for file in *; do
        if [[ -e "$file" ]]; then
            new_name="$(echo "$file" | sed -E 's/[[:space:]]+$//; s/[[:space:]]+\././g; s/\.[[:space:]]+/./g')"

            if [[ "$file" != "$new_name" ]]; then
                mv "$file" "$new_name"
                echo "Renamed '$file' to '$new_name'"
            fi
        fi
    done
    echo "Trailing space removal process completed."
else
    echo "No trailing spaces were removed."
fi

echo "Thank you for using SRU. Goodbye!"