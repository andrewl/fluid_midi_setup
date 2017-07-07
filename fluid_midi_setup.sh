#!/bin/bash

echo "Starting fluidsynth"
fluidsynth -s -i -a pulseaudio -g 2 /usr/share/sounds/sf2/FluidR3_GM.sf2 &

echo "Waiting for fluidsynth to startup"
sleep 10

INPUT_CHANNEL=`aconnect -i | grep client | grep -i Oxygen | cut -f 1 -d ':' | cut -f 2 -d ' '`
OUTPUT_CHANNEL=`aconnect -o | grep client | grep -i Fluid | cut -f 1 -d ':' | cut -f 2 -d ' '`

echo "Input channel: $INPUT_CHANNEL"
echo "Output channel: $OUTPUT_CHANNEL"

echo "Mapping input to output"
aconnect $INPUT_CHANNEL $OUTPUT_CHANNEL

echo "Play teh muzik"
