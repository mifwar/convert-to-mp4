# convert-to-mp4
A simple yet powerful command-line tool to convert videos to MP4 format with optional speed adjustment. This script can handle various video formats as input and always outputs an MP4 file.

## Features

- Converts any video format to MP4
- Adjusts video speed (faster or slower)
- Maintains audio synchronization
- Preserves video quality
- Simple command-line interface

## Prerequisites

Before using this script, make sure you have the following installed:

- **ffmpeg**: The main tool for video conversion
  - Mac: `brew install ffmpeg`
  - Ubuntu/Debian: `sudo apt-get install ffmpeg`
  - CentOS/RHEL: `sudo yum install ffmpeg`
- **zsh**: Z shell (the script uses zsh as interpreter)
  - Mac: Comes pre-installed
  - Ubuntu/Debian: `sudo apt-get install zsh`
  - CentOS/RHEL: `sudo yum install zsh`
- **awk**: Should be pre-installed on most Unix-like systems

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/video-speed-converter.git

2. Make the script executable:
   ```bash
   chmod +x convert_video.sh


## Usage: 
Basic syntax: `./convert_video.sh <input_video> [speed_factor]`

## Examples:
### Convert video to MP4 at normal speed
`./convert_video.sh input.mov`

### Convert video to MP4 at 2x speed
`./convert_video.sh input.mp4 2`

### Convert video to MP4 at half speed
`./convert_video.sh input.avi 0.5`

## Parameters
- input_video: Path to the input video file (supports various formats like .mov, .mp4, .avi, etc.)
- speed_factor (optional):

  - Default: 1 (normal speed)
  - Values > 1: Faster playback (e.g., 2 for double speed)
  - Values < 1: Slower playback (e.g., 0.5 for half speed)



## Output
The script will create an MP4 file in the same directory as the input file

### Output filename format:

- For normal speed: `<original_name>.mp4`
- For modified speed: `<original_name>_<speed>x.mp4`


## How It Works
The script first validates the input parameters and file existence
It calculates the necessary speed adjustment factors
Uses ffmpeg to:

- Convert the video to MP4 format
- Adjust video speed using the setpts filter
- Adjust audio speed using the atempo filter
- Maintain video quality using -q:v 0 parameter


## Known Limitations
- Maximum speed factor might be limited by ffmpeg's capabilities
- For very large speed factors (>2.0), audio quality might be affected
- Some exotic video formats might not be supported (depends on ffmpeg installation)

## Troubleshooting

### "Command not found" error

Make sure the script has execute permissions
Verify that ffmpeg is installed and in your PATH



### "Input file not found" error

Check if the file path is correct
Ensure you have read permissions for the input file



### "Conversion failed" error

Check if you have write permissions in the output directory
Verify that the input file is a valid video file
Check ffmpeg installation
