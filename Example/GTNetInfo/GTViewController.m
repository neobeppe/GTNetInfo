//
//  GTViewController.m
//  GTNetInfo
//
//  Created by Giuseppe Travasoni on 05/21/2015.
//  Copyright (c) 2014 Giuseppe Travasoni. All rights reserved.
//

#import "GTViewController.h"
#import <GTNetInfo.h>

@interface GTViewController ()

@property (weak, nonatomic) IBOutlet UILabel *connectedLabel;
@property (weak, nonatomic) IBOutlet UILabel *wifiConnectedLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellularTechnologyLabel;
@property (weak, nonatomic) IBOutlet UILabel *wifiSsidLabel;
@end

@implementation GTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    GTNetInfo *netInfo = [[GTNetInfo alloc] init];
    [self updateUIWithNetInfo:netInfo];
}

-(void)updateUIWithNetInfo:(GTNetInfo *)netInfo {
    [netInfo isConnected] ? [self.connectedLabel  setText:@"Connected: YES"] : [self.connectedLabel  setText:@"Connected: NO"];
    [netInfo isWifi] ? [self.wifiConnectedLabel  setText:@"WiFi Connection: YES"] : [self.wifiConnectedLabel  setText:@"WiFi Connection: NO"];
    netInfo.currentSSID ? [self.wifiSsidLabel setText:[NSString stringWithFormat:@"WiFi SSID: %@",netInfo.currentSSID]] : [self.wifiSsidLabel setText:@""];
    netInfo.currentRadioTecnology ? [self.cellularTechnologyLabel setText:[NSString stringWithFormat:@"Cellular Technology SSID: %@",netInfo.currentRadioTecnology]] : [self.cellularTechnologyLabel setText:@""];
}

- (IBAction)refreshButtonTapped:(id)sender {
    GTNetInfo *netInfo = [[GTNetInfo alloc] init];
    [self updateUIWithNetInfo:netInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
