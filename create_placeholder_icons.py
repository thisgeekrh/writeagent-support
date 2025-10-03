#!/usr/bin/env python3

import os
from PIL import Image, ImageDraw

def create_placeholder_icon(size, filename):
    """Create a placeholder icon with the WriteAgent design"""
    # Create a new image with a blue gradient background
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Create a blue gradient background
    for y in range(size):
        # Blue gradient from darker to lighter
        blue_value = int(105 + (150 - 105) * y / size)
        color = (1, 33, blue_value, 255)
        draw.line([(0, y), (size, y)], fill=color)
    
    # Draw a simple white circle in the center (placeholder for the pen/house design)
    center = size // 2
    radius = size // 4
    draw.ellipse([center - radius, center - radius, center + radius, center + radius], 
                 fill=(255, 255, 255, 255))
    
    # Save the image
    img.save(filename, 'PNG')
    print(f"Created {filename} ({size}x{size})")

def main():
    # Directory to create icons in
    icon_dir = "/Users/mattstratton/Documents/WriteAgent/WriteAgent/WriteAgent/Assets.xcassets/AppIcon.appiconset"
    
    # Required icon sizes and filenames
    icons = [
        # iPhone icons
        (40, "20@2x.png"),    # 20x20 @2x
        (60, "20@3x.png"),    # 20x20 @3x
        (58, "29@2x.png"),    # 29x29 @2x
        (87, "29@3x.png"),    # 29x29 @3x
        (80, "40@2x.png"),    # 40x40 @2x
        (120, "40@3x.png"),   # 40x40 @3x
        (120, "60@2x.png"),   # 60x60 @2x
        (180, "60@3x.png"),   # 60x60 @3x
        
        # iPad icons
        (20, "20@1x.png"),    # 20x20 @1x
        (40, "20@2x.png"),    # 20x20 @2x (reuse)
        (29, "29@1x.png"),    # 29x29 @1x
        (58, "29@2x.png"),    # 29x29 @2x (reuse)
        (40, "40@1x.png"),    # 40x40 @1x
        (80, "40@2x.png"),    # 40x40 @2x (reuse)
        (152, "76@2x.png"),   # 76x76 @2x
        (167, "83.5@2x.png"), # 83.5x83.5 @2x
        
        # App Store
        (1024, "1024@1x.png") # 1024x1024 @1x
    ]
    
    print("🎨 Creating placeholder WriteAgent icons...")
    print("=" * 50)
    
    for size, filename in icons:
        filepath = os.path.join(icon_dir, filename)
        create_placeholder_icon(size, filepath)
    
    print("=" * 50)
    print("✅ All placeholder icons created!")
    print("📝 Next: Replace these with your actual WriteAgent icons")
    print("📍 Location:", icon_dir)

if __name__ == "__main__":
    main()
