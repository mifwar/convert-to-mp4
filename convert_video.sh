#!/bin/sh

# Function to print usage
print_usage() {
    echo "Usage: $0 <input_video> [speed_factor]"
    echo "Examples:"
    echo "  $0 input.mp4         # Normal speed conversion"
    echo "  $0 input.mov 2       # 2x speed"
    echo "  $0 input.avi 0.5     # Half speed"
    exit 1
}

# Check if at least an input file is provided
if [ $# -eq 0 ]; then
    print_usage
fi

# Get the input file name
input_file="$1"

# Set default speed factor to 1 (normal speed)
speed_factor=1

# If speed factor is provided, use it
if [ $# -eq 2 ]; then
    # Validate that speed_factor is a number
    if ! [[ $2 =~ ^[0-9]*\.?[0-9]+$ ]]; then
        echo "Error: Speed factor must be a positive number"
        exit 1
    fi
    speed_factor=$2
fi

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# Generate the output file name
# Get the filename without extension
filename=$(basename "$input_file")
filename_noext="${filename%.*}"

# If speed is not 1, append the speed factor to the filename
if [ "$speed_factor" = "1" ]; then
    output_file="${filename_noext}.mp4"
else
    output_file="${filename_noext}_${speed_factor}x.mp4"
fi

# Calculate the setpts value (1/speed_factor)
setpts=$(awk "BEGIN {print 1/$speed_factor}")

# Run the ffmpeg command with speed adjustment
ffmpeg -i "$input_file" -filter:v "setpts=${setpts}*PTS" -filter:a "atempo=$speed_factor" -q:v 0 "$output_file"

# Check if the conversion was successful
if [ $? -eq 0 ]; then
    echo "Conversion successful. Output file: $output_file"
    echo "Speed factor: ${speed_factor}x"
else
    echo "Error: Conversion failed."
    exit 1
fi
