//
//  AppDelegate.m
//  AirPlayMacServer
//
//  Created by Alex Corre on 7/19/13.
//  Copyright (c) 2013 Alex Corre. All rights reserved.
//

#import "AppDelegate.h"
#import "DDLog.h"
#import "DDTTYLogger.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@implementation AppDelegate

- (void)awakeFromNib {
  // Setup standard logging to console
  [DDLog addLogger:[DDTTYLogger sharedInstance]];
  
  [self initializeServer];
  [self setupNavigationItem];
}

- (void)setupNavigationItem {
  NSStatusBar *bar = [NSStatusBar systemStatusBar];
  self.statusItem = [bar statusItemWithLength:NSVariableStatusItemLength];
  
  [self.statusItem setTitle: @"Server"];
  [self.statusItem setMenu:self.barMenu];
  [self.statusItem setHighlightMode:YES];
}

- (void)initializeServer {
  self.server = [[HTTPServer alloc] init];
  NSString *docRoot = [@"~/Sites" stringByExpandingTildeInPath];
  [self.server setDocumentRoot:docRoot];
  
  [self.server setPort:8080];
}

- (IBAction)startServer:(id)sender {
  if (![self.server isRunning]) {
    DDLogInfo(@"Starting Server...");
    
    NSError *error = nil;
    if(![self.server start:&error]) {
      DDLogError(@"Error starting HTTP Server: %@", error);
    }
  }
}

- (IBAction)stopServer:(id)sender {
  if ([self.server isRunning]) {
    DDLogInfo(@"Stopping server...");
    [self.server stop];
    
    DDLogInfo(@"Server stopped.");
  }
 }



@end
