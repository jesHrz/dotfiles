#!/bin/bash

sudo modprobe v4l2loopback devices=1 video_nr=10 card_label='OBS Cam' exclusive_caps=1
sudo modprobe snd-aloop index=10 id='OBS Mic'
