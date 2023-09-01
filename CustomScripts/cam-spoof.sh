#/usr/bin/sh
sudo modprobe v4l2loopback card_label="My Webcam" exclusive_caps=1
ffmpeg -stream_loop -1 -re -i $HOME/Videos/Webcam/2021-10-14-183029.webm -vcodec rawvideo -threads 0 -f v4l2 /dev/video2
