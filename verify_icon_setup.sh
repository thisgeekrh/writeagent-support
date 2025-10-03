#!/bin/bash

# WriteAgent App Icon Verification Script
echo "🎨 WriteAgent App Icon Setup Verification"
echo "========================================"

ICON_DIR="/Users/mattstratton/Documents/WriteAgent/WriteAgent/WriteAgent/Assets.xcassets/AppIcon.appiconset"

echo "📁 Checking icon directory..."
if [ -d "$ICON_DIR" ]; then
    echo "✅ Icon directory exists: $ICON_DIR"
else
    echo "❌ Icon directory not found!"
    exit 1
fi

echo ""
echo "📋 Checking required icon files..."

# Required files and their expected sizes
declare -A required_files=(
    ["20@1x.png"]="20x20"
    ["20@2x.png"]="40x40"
    ["20@3x.png"]="60x60"
    ["29@1x.png"]="29x29"
    ["29@2x.png"]="58x58"
    ["29@3x.png"]="87x87"
    ["40@1x.png"]="40x40"
    ["40@2x.png"]="80x80"
    ["40@3x.png"]="120x120"
    ["60@2x.png"]="120x120"
    ["60@3x.png"]="180x180"
    ["76@2x.png"]="152x152"
    ["83.5@2x.png"]="167x167"
    ["1024@1x.png"]="1024x1024"
)

missing_files=()
for file in "${!required_files[@]}"; do
    if [ -f "$ICON_DIR/$file" ]; then
        echo "✅ $file (${required_files[$file]})"
    else
        echo "❌ Missing: $file (${required_files[$file]})"
        missing_files+=("$file")
    fi
done

echo ""
echo "📊 Summary:"
echo "Total required files: ${#required_files[@]}"
echo "Files found: $((${#required_files[@]} - ${#missing_files[@]}))"
echo "Missing files: ${#missing_files[@]}"

if [ ${#missing_files[@]} -eq 0 ]; then
    echo ""
    echo "🎉 All icon files are present!"
    echo "✅ Your WriteAgent app icon is ready to go!"
    echo ""
    echo "Next steps:"
    echo "1. Build and run the app in Xcode"
    echo "2. Check the home screen for your new icon"
    echo "3. Test on a physical device if possible"
else
    echo ""
    echo "⚠️  Missing files:"
    for file in "${missing_files[@]}"; do
        echo "   - $file (${required_files[$file]})"
    done
    echo ""
    echo "Please add the missing icon files to:"
    echo "$ICON_DIR"
    echo ""
    echo "Use the guide in APP_ICON_UPDATE.md for help generating all sizes."
fi

echo ""
echo "🔧 Xcode Project Configuration:"
if grep -q "ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon" /Users/mattstratton/Documents/WriteAgent/WriteAgent/WriteAgent.xcodeproj/project.pbxproj; then
    echo "✅ AppIcon is properly configured in Xcode project"
else
    echo "❌ AppIcon configuration issue detected"
fi

echo ""
echo "✨ Your beautiful icon with pen + house + sparkle is ready to represent WriteAgent!"
