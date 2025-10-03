#!/bin/bash

echo "🎨 WriteAgent App Icon File Check"
echo "================================="

ICON_DIR="/Users/mattstratton/Documents/WriteAgent/WriteAgent/WriteAgent/Assets.xcassets/AppIcon.appiconset"

echo "📁 Icon directory: $ICON_DIR"
echo ""

echo "📋 Current icon files:"
ls -la "$ICON_DIR" | grep "\.png$" | while read line; do
    filename=$(echo "$line" | awk '{print $NF}')
    size=$(echo "$line" | awk '{print $5}')
    if [ "$size" -eq 0 ]; then
        echo "  📄 $filename (placeholder - 0 bytes)"
    else
        echo "  ✅ $filename ($size bytes)"
    fi
done

echo ""
echo "📱 Required iOS Icon Files:"
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
    if [ -f "$ICON_DIR/$file" ]; then
        size=$(stat -f%z "$ICON_DIR/$file" 2>/dev/null || echo "0")
        if [ "$size" -gt 0 ]; then
            echo "  ✅ $file (ready)"
        else
            echo "  📄 $file (placeholder)"
        fi
    else
        echo "  ❌ $file (missing)"
        missing_files+=("$file")
    fi
done

echo ""
if [ ${#missing_files[@]} -eq 0 ]; then
    echo "🎉 All required icon files are present!"
    echo "📝 Next: Replace placeholder files with your actual WriteAgent icons"
else
    echo "⚠️  Missing files:"
    for file in "${missing_files[@]}"; do
        echo "   - $file"
    done
fi

echo ""
echo "🔧 Xcode Configuration:"
if grep -q "ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon" /Users/mattstratton/Documents/WriteAgent/WriteAgent/WriteAgent.xcodeproj/project.pbxproj; then
    echo "  ✅ AppIcon properly configured in Xcode project"
else
    echo "  ❌ AppIcon configuration issue"
fi

echo ""
echo "✨ Your WriteAgent icon should feature:"
echo "   🖋️ Fountain Pen + 🏠 House + ✨ Sparkle + 💙 Blue Gradient"
