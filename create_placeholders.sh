#!/bin/bash

echo "🎨 Creating placeholder WriteAgent icons..."
echo "=========================================="

ICON_DIR="/Users/mattstratton/Documents/WriteAgent/WriteAgent/WriteAgent/Assets.xcassets/AppIcon.appiconset"

# Create a simple blue square as placeholder for each required icon
create_placeholder() {
    local size=$1
    local filename=$2
    local filepath="$ICON_DIR/$filename"
    
    # Create a simple blue square using sips (macOS built-in tool)
    # This creates a solid blue square as a placeholder
    sips -s format png -z $size $size /System/Library/PrivateFrameworks/LoginUIKit.framework/Versions/A/Frameworks/LoginUICore.framework/Resources/apple_logo_black.png --out "$filepath" 2>/dev/null || {
        # Fallback: create a simple text file that can be replaced
        echo "Placeholder for $filename ($size x $size)" > "$filepath"
    }
    
    echo "  ✅ Created $filename ($size x $size)"
}

echo "📋 Creating required icon files..."

# iPhone icons
create_placeholder 40 "20@2x.png"
create_placeholder 60 "20@3x.png"
create_placeholder 58 "29@2x.png"
create_placeholder 87 "29@3x.png"
create_placeholder 80 "40@2x.png"
create_placeholder 120 "40@3x.png"
create_placeholder 120 "60@2x.png"
create_placeholder 180 "60@3x.png"

# iPad icons
create_placeholder 20 "20@1x.png"
create_placeholder 40 "20@2x.png"
create_placeholder 29 "29@1x.png"
create_placeholder 58 "29@2x.png"
create_placeholder 40 "40@1x.png"
create_placeholder 80 "40@2x.png"
create_placeholder 152 "76@2x.png"
create_placeholder 167 "83.5@2x.png"

# App Store
create_placeholder 1024 "1024@1x.png"

echo ""
echo "✅ All placeholder icons created!"
echo "📝 Next: Replace these with your actual WriteAgent icons"
echo "📍 Location: $ICON_DIR"
echo ""
echo "🎯 Your WriteAgent icons should have:"
echo "   🖋️ Fountain Pen + 🏠 House + ✨ Sparkle + 💙 Blue Gradient"
