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
            _SSID = [self currentWifiSSID];
            _MAC = [self currentMACAddress];
            [self proxyFill];
        }
        if (_connected) {
            _radioTecnology = [self getConnectionType];
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

- (NSString *)currentMACAddress {
    
    // Does not work on the simulator.
    NSString *mac = nil;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info[@"BSSID"]) {
            mac = info[@"BSSID"];
        }
    }
    
    NSArray *components = [mac componentsSeparatedByString:@":"];
    
    NSString *macToReturn = @"";
    for (NSString *component in components) {
        if (component.length == 1) macToReturn = [macToReturn stringByAppendingFormat:@"0%@",component];
        else macToReturn = [macToReturn stringByAppendingFormat:@"%@",component];
        if ([components indexOfObject:component] != 5) macToReturn = [macToReturn stringByAppendingString:@"-"];
    }
    
    return [macToReturn uppercaseString];
}

- (NSString *)getConnectionType {
    
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    return telephonyInfo.currentRadioAccessTechnology;
}

- (void)proxyFill {
    
    NSString *host = @"";
    NSString *port = @"";
    
    CFDictionaryRef dicRef = CFNetworkCopySystemProxySettings();
    const CFNumberRef portCFnum = (const CFNumberRef)CFDictionaryGetValue(dicRef, (const void*)kCFNetworkProxiesHTTPPort);
    if (portCFnum) {
        SInt32 portInt;
        if (CFNumberGetValue(portCFnum, kCFNumberSInt32Type, &portInt)){
            port = [NSString stringWithFormat:@"%d",(int)portInt];
        }
    }
    
    const CFStringRef proxyCFstr = (const CFStringRef)CFDictionaryGetValue(dicRef, (const void*)kCFNetworkProxiesHTTPProxy);
    char buffer[4096];
    memset(buffer, 0, 4096);
    if (proxyCFstr) {
        if (CFStringGetCString(proxyCFstr, buffer, 4096, kCFStringEncodingUTF8))
        {
            host = [NSString stringWithFormat:@"%s",buffer];
        }
    }
    
    if ([host isEqualToString:@""] && [port isEqualToString:@""]) {
        _proxy = NO;
        _proxyAddress = nil;
        _proxyPort = nil;
    }
    else {
        _proxy = YES;
        _proxyAddress = host;
        _proxyPort = port;
    }
}



@end