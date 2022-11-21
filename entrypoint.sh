#!/bin/ash

/rtsp-simple-server &
pid_rss=$!

ffmpeg -re -stream_loop -1 -i /publish_video.mp4 -c copy -f rtsp rtsp://localhost:8554/$STREAM_NAME

kill pid_rss
