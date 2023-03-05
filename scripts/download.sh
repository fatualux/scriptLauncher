#!/bin/sh
#This script opens a shell prompt, asks user for the video url and lists all available format of the medium.
#Then, it asks the user to choose between five common video/audio formats and for a name to give to the downloaded file, and saves it to the user's home directory.
#It depends on: bash yt-dlp ffmpeg

################################ FUNCTIONS ################################

ListActions() {
  echo ""
  echo "Choose an action to perform:"
  echo "1. Download a video"
  echo "2. Extract the audio from a video"
  echo "3. Download a video playlist"
  echo "4. Download an audio playlist"
  read -p "Enter your selection: " choice
  case $choice in
    1)
      echo "You selected Download a video"
      ACTION="download"
      ;;
    2)
        echo "You selected Extract the audio from a video"
      ACTION="extract"
      ;;
    3)
      echo "You selected Download video playlist"
      ACTION="v_playlist"
      ;;
    4)
      echo "You selected Download audio playlist"
      ACTION="a_playlist"
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
  # Export the user's input variable
  export ACTION
}

ListVideoFormats() {
  echo ""
  echo "Choose a video format:"
  echo "1. MP4"
  echo "2. MKV"
  echo "3. AVI"
  echo "4. M4A"
  echo "5. FLV"
  echo "6. WEBM"
  read -p "Enter your selection: " choice
  case $choice in
    1)
      echo "You selected mp4"
      V_FORMAT="mp4"
      ;;
    2)
      echo "You selected mkv"
      V_FORMAT="mkv"
      ;;
    3)
      echo "You selected avi"
      V_FORMAT="avi"
      ;;
    4)
      echo "You selected m4a"
      V_FORMAT="m4a"
      ;;
    5)
      echo "You selected flv"
      V_FORMAT="flv"
      ;;
    6)
      echo "You selected webm"
      V_FORMAT="webm"
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
  # Export the user's input variable
  export V_FORMAT
}

ListMediaFormats() {
  echo ""
  echo "Choose a media format:"
  echo "1. MP3"
  echo "2. FLAC"
  echo "3. WAV"
  echo "4. MP4"
  echo "5. MKV"
  echo "6. AVI"
  read -p "Enter your selection: " choice
  case $choice in
    1)
      echo "You selected MP3"
      M_FORMAT="mp3"
      ;;
    2)
      echo "You selected FLAC"
      M_FORMAT="flac"
      ;;
    3)
      echo "You selected WAV"
      M_FORMAT="wav"
      ;;
    4)
      echo "You selected MP4"
      M_FORMAT="mp4"
      ;;
    5)
      echo "You selected MKV"
      M_FORMAT="mkv"
      ;;
    6)
      echo "You selected AVI"
      M_FORMAT="avi"
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
  # Export the user's input variable
  export M_FORMAT
}

InsertURL() {
  echo ""
  echo "Paste a media URL:"
  read -r URL
  # Export the user_input variable
  export URL
}

################################## SCRIPT ##################################

ListActions

if [ "$ACTION" = "download" ]; then
  echo ""
  echo "VIDEO DOWNLOADER"
  InsertURL
  echo "Downloading..."
  yt-dlp -o "%(title)s" -i --hls-prefer-ffmpeg "$URL"
  echo "Done!"
fi
if [ "$ACTION" = "extract" ]; then
  echo ""
  echo "AUDIO EXTRACTOR"
  InsertURL
  ListMediaFormats
  yt-dlp --audio-quality "ba" -x --audio-format "$M_FORMAT" "$URL" -o "%(title)s.%(ext)s"
  echo "Done!"
fi
if [ "$ACTION" = "v_playlist" ]; then
  echo ""
  echo "VIDEO PLAYLIST DOWNLOADER"
  InsertURL
  ListVideoFormats
  yt-dlp -f 'bv*[height=1080]+ba' "$URL" -o '%(title)s.%(ext)s'  --lazy-playlist
  echo "Downloading..."
  echo "Done!"
fi
if [ "$ACTION" = "a_playlist" ]; then
  echo ""
  echo "AUDIO PLAYLIST DOWNLOADER"
  InsertURL
  ListMediaFormats
  yt-dlp --audio-quality "ba" -x --audio-format "$A_FORMAT" "$URL" -o '%(title)s.%(ext)s' --lazy-playlist
  echo "Downloading..."
  echo "Done!"
fi
