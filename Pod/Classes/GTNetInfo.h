//
//  GTNetInfo.h
//  Pods
//
//  Created by Giuseppe Travasoni on 21/05/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@interface GTNetInfo : NSObject

@property (nonatomic, readonly, getter=isConnected) BOOL connected;
@property (nonatomic, readonly, getter=isWifi) BOOL wifi;
@property (nonatomic, readonly, getter=isProxy) BOOL proxy;
@property (nonatomic, readonly) NSString *radioTecnology;
@property (nonatomic, readonly) NSString *SSID;
@property (nonatomic, readonly) NSString *MAC;
@property (nonatomic, readonly) NSString *proxyAddress;
@property (nonatomic, readonly) NSString *proxyPort;

@end
