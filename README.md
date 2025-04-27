# AppStoreLookup

A command-line tool to easily retrieve app information and icons from the App Store URL.

## Overview

AppStoreLookup is a simple tool that allows you to get app information (bundle ID, app name) and high-resolution icon images by just specifying an App Store URL. The retrieved icons are saved to a specified directory.

## Features

- Extract app IDs from App Store URLs
- Retrieve app information using iTunes Lookup API
- Download and save app icons (512px)
- Save files with names based on bundle ID

## Installation

### Method 1: Clone and Build

```bash
git clone https://github.com/noppefoxwolf/AppStoreLookup.git
cd AppStoreLookup
swift build -c release
sudo cp .build/release/appstore-lookup /usr/local/bin/
```

### Method 2: Using experimental-install

You can install AppStoreLookup directly using Swift's experimental-install feature:

```bash
swift experimental-install noppefoxwolf/AppStoreLookup
```

This will download the package, build it, and install the executable in a location where it can be accessed from your terminal.

### Method 3: Direct Run with Swift Package Manager

```bash
swift run appstore-lookup [arguments]
```

## Usage

```bash
appstore-lookup <App Store URL> --output <destination directory>
```

### Example

```bash
appstore-lookup https://apps.apple.com/jp/app/twitter/id333903271 --output icons
```

When you run the above command:
1. The Twitter app ID is extracted
2. App information is retrieved
3. 512px size icon is saved to the "icons" directory
4. The file is saved with the app's bundle ID as the filename.png

## Requirements

- Swift 6.1 or later
- macOS 13 or later
- Dependencies:
  - swift-argument-parser
  - swift-http-types

## License

MIT License

## Author

[@noppefoxwolf](https://github.com/noppefoxwolf)


