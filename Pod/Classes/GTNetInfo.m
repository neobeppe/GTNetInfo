//
//  GTNetInfo.m
//  Pods
//
//  Created by Giuseppe Travasoni on 21/05/15.
//
//

#import "GTNetInfo.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <Reachability/Reachability.h>

@implementation GTNetInfo

- (instancetype)init {
    self = [super init];
    if (self) {
        Reachability *reach = [Reachability reachabilityForInternetConnection];
        _wifi = [reach isReachableViaWiFi];
        _connected = [reach isReachable];
        if (_wifi) {
            _currentSSID = [self currentWifiSSID];
        }
        if (_connected) {
            _currentRadioTecnology = [self getConnectionType];
        }
    }
    return self;
}

- (NSString *)currentWifiSSID {
    // Does not work on the simulator.
    NSString *ssid = nil;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info[@"SSID"]) {
            ssid = info[@"SSID"];
        }
    }
    return ssid;
}

- (NSString *)getConnectionType {
    
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    return telephonyInfo.currentRadioAccessTechnology;
}

@end