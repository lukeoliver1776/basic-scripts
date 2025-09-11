#!/bin/bash

#Bulk file mover utility
#Moves files from one directory to another based on user input
#WARNING this will move ALL files with the inputted file extension from the original directory to the inputted directory.
#This Script is intended for bulk moving of files, not individual files.
#Created with the assistance of Copilot

echo "Welcome to BFMU - Bulk File Mover Utility"
echo "This utility moves files from one directory to another."
echo "Please enter the source directory path:"
read src_dir
if [ ! -d "src_dir" ]; then
    echo "Source directory does not exist...exiting"
    exit 1
fi
echo "Please enter the destination directory path:"
read dest_dir
if [ ! -d "dest_dir" ]; then
    echo "Destination directory does not exist...exiting"
    exit 1
fi
echo "Please enter the file extension to move (e.g., .mkv, .txt):"
read file_ext
if [[ -z "$file_ext" ]]; then
    echo "No file extension provided...exiting"
    exit 1
fi

case "$file_ext" in
    # Documents / Text
    txt|pdf|doc|docx|xls|xlsx|ppt|pptx|odt|rtf|md)

        ;;

    # Images
    jpg|jpeg|png|gif|bmp|tiff|svg|heic)

        ;;

    # Audio
    mp3|wav|aac|flac|ogg)

        ;;

    # Video
    mp4|mkv|avi|mov|wmv|flv)

        ;;

    # Compressed / Archives
    zip|rar|7z|tar|gz)

        ;;

    # Code / Scripts
    sh|py|js|java|c|cpp|html|css)

        ;;

    *)
        echo "Invalid file extension...exiting"
        exit 1
        ;;
esac

echo "You are about to move all files with the extension '$file_ext' from '$src_dir' to '$dest_dir'."
echo "Are you sure you want to proceed? (y/n)"
read confirmation
if [[ "$confirmation" != "y" ]]; then
    echo "Operation cancelled. Exiting."
    exit 0
fi 

