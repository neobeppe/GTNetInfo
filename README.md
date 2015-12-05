# GTNetInfo

[![CI Status](http://img.shields.io/travis/neobeppe/GTNetInfo.svg?style=flat)](https://travis-ci.org/neobeppe/GTNetInfo)
[![Version](https://img.shields.io/cocoapods/v/GTNetInfo.svg?style=flat)](http://cocoapods.org/pods/GTNetInfo)
[![License](https://img.shields.io/cocoapods/l/GTNetInfo.svg?style=flat)](http://cocoapods.org/pods/GTNetInfo)
[![Platform](https://img.shields.io/cocoapods/p/GTNetInfo.svg?style=flat)](http://cocoapods.org/pods/GTNetInfo)
##Info
This is a very first alpha release of NetInfo. This library give you an istant access to connectivity status of your device as a snapshot.

## Installation

GTNetInfo is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GTNetInfo"
```

In alternative, just download the project and import .h,.m files. Remember that GTNetInfo has Tony Million's [Reachability](https://github.com/tonymillion/Reachability) dependency and needs CoreTelephony.framework and SystemConfiguration.framework

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

To use NetInfo just import it anywhere you need to use it:
```objective-c
#import <GTNetInfo.h>
```
Create a GtNetInfo object:
```objective-c
GTNetInfo *netInfo = [[GTNetInfo alloc] init];
```
Inside this object you'll find 4 properties, 2 boolean and 2 strings.

```objective-c
//Is device currently connected?
BOOL connected = [netInfo isConnected];
    
//Is device currently connected to a Wi-Fi network?
BOOL connectedWifi = [netInfo isWifi];
    
//If device is currently connected to a Wi-Fi network, what's the SSID?
NSString* SSID = [netInfo currentSSID];
    
//If device is currently connected, which radio technology is using?
NSString* radioTecnology = [netInfo currentRadioTecnology];
```
## Requirements
NB: This Alpha does not work on simulator. 

## Author

Giuseppe Travasoni, giuseppe.travasoni@gmail.com

## License

GTNetInfo is available under the MIT license. See the LICENSE file for more info.
