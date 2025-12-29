#!/bin/bash

echo "Starting privacy cleanup..."
echo "Ensure the phone is connected with USB Debugging enabled."
echo ""

# Check for ADB connection
adb devices
echo ""

# Safety Check - Confirmation Prompt
echo "CRITICAL WARNING: This script removes system apps including the default keyboard and browser."
read -p "Have you already downloaded/installed a replacement Keyboard, Browser, and F-Droid? (y/n): " confirm

# Regex to check for 'y' or 'Y'
if [[ ! $confirm =~ ^[Yy]$ ]]; then
    echo ""
    echo "Aborted. Please install the necessary replacements before running this script."
    echo "Press enter to exit."
    read
    exit 1
fi

echo ""
echo "Proceeding with removal..."
echo ""

PACKAGES=(
    "com.google.android.feedback"
    "com.multilaser.mscustomapp"
    "com.google.android.gm"
    "com.google.android.printservice.recommendation"
    "com.android.gallery3d"
    "com.android.musicfx"
    "com.google.android.partnersetup"
    "com.android.chrome"
    "com.google.android.contacts"
    "com.android.camera2"
    "com.google.android.apps.docs"
    "com.google.android.apps.tachyon"
    "com.google.android.apps.nbu.files"
    "com.google.android.inputmethod.latin"
    "com.google.android.apps.photosgo"
    "com.google.android.apps.assistant"
    "com.google.android.videos"
    "com.instagram.lite"
    "br.com.multilaser.lsitec.uai"
    "com.facebook.lite"
    "com.google.android.apps.maps"
    "com.google.android.apps.messaging"
    "penseavanti.com.br.app2shop_multilaser"
    "com.google.android.deskclock"
    "com.google.android.syncadapters.contacts"
    "com.google.android.dialer"
    "com.google.android.youtube"
    "com.google.android.youtube.music"
    "com.google.android.apps.youtube.music"
    "com.google.android.soundrecorder"
    "com.android.soundrecorder"
    "com.google.android.gms.location.history"
    "com.google.android.apps.searchlite"
    "com.android.fmradio"
    "com.google.android.onetimeinitializer"
    "com.android.egg"
)

for package in "${PACKAGES[@]}"; do
    echo "Removing: $package"
    adb shell pm uninstall -k --user 0 "$package"
done

echo ""
echo "Cleaning finished. Please reboot the phone."
echo "Press enter to exit."
read
