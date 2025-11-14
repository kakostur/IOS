# My Favorites TableView 📚🎬🎵

## Overview
This is a simple **iOS app** built with **UIKit** that displays my favorite items across **four categories** using a `UITableView`.  
It demonstrates **custom cells**, **Auto Layout**, and **dynamic table views** with multiple sections.

## Features
- Displays **4 sections**: Movies, Music, Books, University Courses  
- Each section has **5 items** with:
  - Image (cover art or icon)  
  - Title  
  - Subtitle (director, author, or other details)  
  - Personal review (2–3 lines)  
- Dynamic cell height using `UITableView.automaticDimension`  
- Works smoothly on different iPhone screen sizes  
- Supports both **light** and **dark mode**

## Technology Stack
- **Framework:** UIKit  
- **Language:** Swift  
- **iOS Version:** 15.0+  
- **Layout Tool:** Auto Layout with Stack Views  

## How It Works
- The app stores items in arrays of `FavoriteItem` objects.  
- Each `FavoriteItem` contains:
  - Title  
  - Subtitle  
  - Image  
  - Personal review  
- Custom `UITableViewCell` displays the above information in a well-designed layout.  
- Sections are clearly labeled with titles for easy navigation.

## Known Limitations
- No search or filtering yet  
- No interactive cell actions  

## Devices Tested
- iPhone 16 Pro  
- iPad Air 11 inch M4

## Resources Used
- **SF Symbols** for fallback icons  
- **Apple Developer Documentation** for UITableView and Auto Layout  
- Custom images for movies, music, books, and courses  

---

**Made with ❤️ by Karakat Tursynbayeva**

