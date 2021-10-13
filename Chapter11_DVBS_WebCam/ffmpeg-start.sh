# Edit this file modify path to audio and TX (for OSD) file, change CALLSIGN

AUDIOFILE=/home/wcc/GNU_Radio/Lab/source_audio/music1_mono48kHz.wav
TEXTFILE=/home/wcc/GNU_Radio/Lab/source_audio/datv_text.txt
CALLSIGN=Microphase

ffmpeg -r 15 -i '/dev/video0' -i $AUDIOFILE -acodec mp2  -f mpegts -b:v 0.2M -s 320x240 \
-vf "drawtext=textfile=$TEXTFILE:x=60:y=34:fontsize=40:shadowx=3:shadowy=3:fontcolor=red:shadowcolor=white" \
-b:a 128k -ar 44100 -ac 2 -af asetpts=N/SR/TB \
-mpegts_service_id 1 -metadata service_provider=$CALLSIGN -metadata service_name=$CALLSIGN \
-r 15 -ignore_unknown -pix_fmt yuv420p udp://127.0.0.1:58000

