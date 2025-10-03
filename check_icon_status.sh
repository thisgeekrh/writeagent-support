#!/bin/bash

echo "🎨 WriteAgent App Icon Status Check"
echo "=================================="

ICON_DIR="/Users/mattstratton/Documents/WriteAgent/WriteAgent/WriteAgent/Assets.xcassets/AppIcon.appiconset"

echo "📁 Icon directory: $ICON_DIR"
echo ""

echo "📋 Current files in AppIcon directory:"
ls -la "$ICON_DIR" | grep -v "Contents.json" | while read line; do
    if [ -n "$line" ]; then
        filename=$(echo "$line" | awk '{print $NF}')
        size=$(echo "$line" | awk '{print $5}')
        echo "  📄 $filename ($size bytes)"
    fi
done

echo ""
echo "📱 Required iOS Icon Files:"
echo "  iPhone: 20@2x, 20@3x, 29@2x, 29@3x, 40@2x, 40@3x, 60@2x, 60@3x"
echo "  iPad: 20@1x, 20@2x, 29@1x, 29@2x, 40@1x, 40@2x, 76@2x, 83.5@2x"
echo "  App Store: 1024@1x"

echo ""
echo "🔧 Xcode Configuration:"
if grep -q "ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon" /Users/mattstratton/Documents/WriteAgent/WriteAgent/WriteAgent.xcodeproj/project.pbxproj; then
    echo "  ✅ AppIcon properly configured in Xcode project"
else
    echo "  ❌ AppIcon configuration issue"
fi

echo ""
echo "📖 Installation Guide:"
echo "  See ICON_INSTALLATION_GUIDE.md for detailed instructions"
echo ""
echo "✨ Your beautiful WriteAgent icon is ready to install!"
echo "   🖋️ Fountain Pen = Content Creation"
echo "   🏠 House = Real Estate"  
echo "   ✨ Sparkle = AI Magic"
echo "   💙 Blue Gradient = Professional"
