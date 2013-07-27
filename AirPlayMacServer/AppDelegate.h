//
//  AppDelegate.h
//  AirPlayMacServer
//
//  Created by Alex Corre on 7/19/13.
//  Copyright (c) 2013 Alex Corre. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HTTPServer.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) NSStatusItem *statusItem;
@property (nonatomic, strong) IBOutlet NSMenu *barMenu;
@property (nonatomic, strong) HTTPServer *server;


/**
 * setupNavigationItem
 *
 * !Sets up the navigation menu and adds it to the navigation bar
 */
- (void)setupNavigationItem;

/**
 * initializeServer
 *
 * !Creates + initializes the server property. Sets up settings.
 */
- (void)initializeServer;

/**
 * startServer
 *
 * !Sets up the navigation menu and adds it to the navigation bar
 */
- (IBAction)startServer:(id)sender;

/**
 * stopServer
 *
 * !Sets up the navigation menu and adds it to the navigation bar
 */
- (IBAction)stopServer:(id)sender;

@end
