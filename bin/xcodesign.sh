#!/bin/bash

set -eu

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 11.5" >&2
  exit 1
fi

echo "codesiging Xcode-$1 ..."
codesign -f -s XcodeSigner /Applications/Xcode-$1.app

echo "codesiging Xcode-$1/.../xcodebuild ..."
codesign -f -s XcodeSigner /Applications/Xcode-$1.app/Contents/Developer/usr/bin/xcodebuild
