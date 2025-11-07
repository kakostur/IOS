# Karakat_MusicPlayer 🎵

## Overview
This is a simple and elegant **Music Player app** built with **UIKit**.  
It allows users to play, pause, and switch between songs using a clean interface designed with **UIStackView** and **Auto Layout**.

## Features
- Play, pause, next, and previous buttons using **SF Symbols**
- Displays track title and album cover
- Automatically plays the next song when the current one ends
- Works smoothly on different iPhone screen sizes
- Supports both **light** and **dark mode**

## Technology Stack
- **Framework:** UIKit  
- **Language:** Swift  
- **iOS Version:** 15.0+  
- **Layout Tool:** UIStackView with Auto Layout  

## How It Works
- The app stores songs in an array of `Song` objects.
- Each `Song` contains:
  - Title  
  - Cover image  
  - Audio file name  
- The `AVAudioPlayer` is used for playback.  
- When a song finishes, the next one automatically starts.

## Bonus Features
✅ Dark Mode Support  
✅ Auto Play Next Song  
✅ Artist Name Display

## Known Limitations
- No progress bar or time display yet  
- No shuffle or repeat mode  

## Devices Tested
- iPhone 16 Pro  
- iPad Air 11 inch M4

## Resources Used
- **SF Symbols** for button icons (`play.fill`, `pause.fill`, `backward.fill`, `forward.fill`)
- **Apple Developer Documentation** for UIKit and AVFoundation  
- Custom album cover images from free sources  

---

**Made with ❤️ by Karakat Tursynbayeva**

