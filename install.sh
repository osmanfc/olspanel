#!/bin/sh

# Detect OS version
OUTPUT=$(cat /etc/*release)

if echo "$OUTPUT" | grep -q "Ubuntu 18.04"; then
    SERVER_OS="Ubuntu"
elif echo "$OUTPUT" | grep -q "Ubuntu 20.04"; then
    SERVER_OS="Ubuntu"
elif echo "$OUTPUT" | grep -q "Ubuntu 22.04"; then
    SERVER_OS="Ubuntu"
elif echo "$OUTPUT" | grep -q "Ubuntu 24.04"; then
    SERVER_OS="Ubuntu"
else
    echo -e "\nOwPanel is supported only on Ubuntu 18.04, 20.04, 22.04, and 24.04. Other OS support coming soon.\n"
    exit 1
fi

# Update system and install required packages
sudo apt update -qq && sudo apt install -y -qq wget curl

wget -O panel.sh "https://raw.githubusercontent.com/osmanfc/owpanel/main/$SERVER_OS/panel.sh" 2>/dev/null
wget -O requirements.txt "https://raw.githubusercontent.com/osmanfc/owpanel/main/requirements.txt" 2>/dev/null

# Ensure the script is executable
chmod +x panel.sh
sed -i 's/\r$//' panel.sh

sh panel.sh
