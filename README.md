# Drum Machine Project

This project is a simple and interactive drum machine built using SuperCollider. The drum machine allows users to create rhythmic patterns for kick, snare, and hi-hat sounds, customize the tempo, and start/stop playback. The graphical user interface (GUI) includes buttons for step sequencing, a tempo slider, and visual separators for enhanced usability.

---

## Features

### 1. **Synth Definitions**
- **Kick Drum**: A low-frequency sine wave with an exponential envelope.
- **Snare Drum**: White noise with a short percussive envelope.
- **Hi-Hat**: High-pass filtered white noise with a sharp attack and decay.

### 2. **Step Sequencer**
- A grid of buttons for each drum sound (kick, snare, hi-hat).
- Buttons toggle between active (green) and inactive (red) states.
- Patterns are visually divided into groups of 4 steps for readability.

### 3. **Tempo Control**
- A slider adjusts the playback tempo in real-time, ranging from 60 to 180 BPM.

### 4. **Playback Control**
- A "Start/Stop" button to control playback of all drum patterns simultaneously.

---

## User Interface Overview

### Main Components:
1. **Grid of Buttons**:
   - 3 rows: Kick, Snare, and Hi-Hat.
   - 16 steps per row for pattern creation.
2. **Horizontal Separators**:
   - Lines are drawn every 4 steps for visual clarity in the sequencer.
3. **Tempo Slider**:
   - Positioned above the sequencer to control playback speed.
4. **Start/Stop Button**:
   - Located below the sequencer for convenient playback control.

---

## How It Works

1. **Start the Server**: Boot the SuperCollider server (`s.waitForBoot`).
2. **Define Synths**: Create SynthDefs for the kick, snare, and hi-hat sounds.
3. **Initialize Patterns**: Use arrays to store the on/off states for each step in the sequencer.
4. **Play Patterns**: Use routines to iterate over the pattern arrays, triggering the respective Synths at the correct time intervals based on the tempo.
5. **GUI Interaction**:
   - Toggle buttons to create patterns.
   - Adjust tempo with the slider.
   - Start or stop playback with the "Start/Stop" button.
