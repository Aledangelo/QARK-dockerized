#!/bin/bash

qark --sdk-path /qark/cmdline-tools/ --apk apk/app.apk --exploit-apk
echo "Just wait a few seconds..."
sleep 5
cp -r /qark/build/app_exploit_apk/app/build/outputs/apk /qark/exploit/