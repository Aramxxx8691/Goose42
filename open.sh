#!/bin/bash

# Set the paths
APP_PATH="$HOME/goinfre/LockScreen42/DesktopGoose.app"
PLIST_PATH="$HOME/Library/LaunchAgents/com.example.startgoose.plist"
SCRIPT_PATH="$HOME/goinfre/LockScreen42/start_goose.sh"

# Create the shell script
echo "#!/bin/bash" > "$SCRIPT_PATH"
echo "open \"$APP_PATH\"" >> "$SCRIPT_PATH"
echo "launchctl load \"$PLIST_PATH\"" >> "$SCRIPT_PATH"

# Make the shell script executable
chmod +x "$SCRIPT_PATH"

# Create the property list
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > "$PLIST_PATH"
echo "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">" >> "$PLIST_PATH"
echo "<plist version=\"1.0\">" >> "$PLIST_PATH"
echo "<dict>" >> "$PLIST_PATH"
echo "    <key>Label</key>" >> "$PLIST_PATH"
echo "    <string>com.example.startgoose</string>" >> "$PLIST_PATH"
echo "    <key>ProgramArguments</key>" >> "$PLIST_PATH"
echo "    <array>" >> "$PLIST_PATH"
echo "        <string>$SCRIPT_PATH</string>" >> "$PLIST_PATH"
echo "    </array>" >> "$PLIST_PATH"
echo "    <key>RunAtLoad</key>" >> "$PLIST_PATH"
echo "    <true/>" >> "$PLIST_PATH"
echo "    <key>KeepAlive</key>" >> "$PLIST_PATH"
echo "    <false/>" >> "$PLIST_PATH"
echo "</dict>" >> "$PLIST_PATH"
echo "</plist>" >> "$PLIST_PATH"

# Load the launch agent
launchctl load "$PLIST_PATH"
