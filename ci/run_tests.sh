#!/bin/sh

xcodebuild test -project PivotalPong.xcodeproj -scheme PivotalPong -destination 'platform=iOS Simulator,name=iPhone 6s,OS=9.2'
