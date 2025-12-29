@echo off

echo Ensure the phone is connected with USB Debugging enabled.
echo.

:: Safety Check - Confirmation Prompt
echo CRITICAL WARNING: This script removes system apps including the default keyboard and browser.
set /p "confirm=Have you already downloaded the keyboard, browser, and F-Droid? (y/n): "

:: Verifica a resposta (se não for y, pula para o fim)
if /i not "%confirm%"=="y" goto abort

echo.
echo Proceeding with removal...
echo.

:: Removal List
adb shell pm uninstall -k --user 0 com.google.android.feedback
adb shell pm uninstall -k --user 0 com.multilaser.mscustomapp
adb shell pm uninstall -k --user 0 com.google.android.gm
adb shell pm uninstall -k --user 0 com.google.android.printservice.recommendation
adb shell pm uninstall -k --user 0 com.google.android.marvin.talkback
adb shell pm uninstall -k --user 0 com.android.gallery3d
adb shell pm uninstall -k --user 0 com.android.musicfx
adb shell pm uninstall -k --user 0 com.google.android.partnersetup
adb shell pm uninstall -k --user 0 com.android.chrome
adb shell pm uninstall -k --user 0 com.google.android.contacts
adb shell pm uninstall -k --user 0 com.android.camera2
adb shell pm uninstall -k --user 0 com.google.android.apps.docs
adb shell pm uninstall -k --user 0 com.google.android.apps.tachyon
adb shell pm uninstall -k --user 0 com.google.android.apps.nbu.files
adb shell pm uninstall -k --user 0 com.google.android.inputmethod.latin
adb shell pm uninstall -k --user 0 com.google.android.apps.photosgo
adb shell pm uninstall -k --user 0 com.google.android.apps.assistant
adb shell pm uninstall -k --user 0 com.google.android.videos
adb shell pm uninstall -k --user 0 com.instagram.lite
adb shell pm uninstall -k --user 0 br.com.multilaser.lsitec.uai
adb shell pm uninstall -k --user 0 com.facebook.lite
adb shell pm uninstall -k --user 0 com.google.android.apps.maps
adb shell pm uninstall -k --user 0 com.google.android.apps.messaging
adb shell pm uninstall -k --user 0 penseavanti.com.br.app2shop_multilaser
adb shell pm uninstall -k --user 0 com.google.android.deskclock
adb shell pm uninstall -k --user 0 com.google.android.syncadapters.contacts
adb shell pm uninstall -k --user 0 com.google.android.dialer
adb shell pm uninstall -k --user 0 com.google.android.youtube
adb shell pm uninstall -k --user 0 com.google.android.youtube.music
adb shell pm uninstall -k --user 0 com.google.android.apps.youtube.music
adb shell pm uninstall -k --user 0 com.google.android.soundrecorder
adb shell pm uninstall -k --user 0 com.android.soundrecorder
adb shell pm uninstall -k --user 0 com.google.android.gms.location.history
adb shell pm uninstall -k --user 0 com.google.android.apps.searchlite
adb shell pm uninstall -k --user 0 com.android.fmradio
adb shell pm uninstall -k --user 0 com.google.android.onetimeinitializer
adb shell pm uninstall -k --user 0 com.android.egg

echo.
echo Cleaning finished! Please reboot your phone.
pause
exit /b

:abort
echo.
echo Process aborted. Please download the required apps first.
pause
