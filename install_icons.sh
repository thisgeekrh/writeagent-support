#!/bin/bash

echo "🎨 Installing WriteAgent App Icons"
echo "=================================="

# Source directory (where your icons are)
SOURCE_DIR="/Users/mattstratton/Documents/WriteAgent/AppIcon.appiconset"

# Target directory (Xcode project)
TARGET_DIR="/Users/mattstratton/Documents/WriteAgent/WriteAgent/WriteAgent/Assets.xcassets/AppIcon.appiconset"

echo "📁 Source: $SOURCE_DIR"
echo "📁 Target: $TARGET_DIR"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "❌ Source directory not found: $SOURCE_DIR"
    echo "Please make sure your AppIcon.appiconset folder is in the WriteAgent directory"
    exit 1
fi

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

echo ""
echo "📋 Copying icon files..."

# Copy all PNG files
for file in "$SOURCE_DIR"/*.png; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        cp "$file" "$TARGET_DIR/$filename"
        echo "  ✅ $filename"
    fi
done

echo ""
echo "🔍 Verifying installation..."

# Check if all required files are present
required_files=(
    "20@1x.png" "20@2x.png" "20@3x.png"
    "29@1x.png" "29@2x.png" "29@3x.png"
    "40@1x.png" "40@2x.png" "40@3x.png"
    "60@2x.png" "60@3x.png"
    "76@2x.png" "83.5@2x.png"
    "1024@1x.png"
)

missing_files=()
for file in "${required_files[@]}"; do
    if [ -f "$TARGET_DIR/$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ Missing: $file"
        missing_files+=("$file")
    fi
done

echo ""
if [ ${#missing_files[@]} -eq 0 ]; then
    echo "🎉 All app icons installed successfully!"
    echo "✅ Your WriteAgent app icon is ready!"
    echo ""
    echo "🚀 Next steps:"
    echo "  1. Build and run the app in Xcode"
    echo "  2. Check the home screen for your new icon"
    echo "  3. Test on a physical device"
else
    echo "⚠️  Missing files:"
    for file in "${missing_files[@]}"; do
        echo "   - $file"
    done
    echo ""
    echo "Please ensure all required icon files are in your AppIcon.appiconset folder"
fi

echo ""
echo "✨ Your beautiful WriteAgent icon with pen + house + sparkle is ready!"
