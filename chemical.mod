module webview

source "src"

import "chemicallang/webview" branch "win-x64" if windows and !arm
import "chemicallang/webview" branch "win-arm64" if windows and arm

import "chemicallang/webview" branch "linux-x64" if linux and !arm
import "chemicallang/webview" branch "linux-arm64" if linux and arm

import "chemicallang/webview" branch "linuxmusl-x64" if linux and musl and !arm
import "chemicallang/webview" branch "linuxmusl-arm64" if linux and musl and arm

import "chemicallang/webview" branch "macos-x64" if macos and !arm
import "chemicallang/webview" branch "macos-arm64" if macos and arm