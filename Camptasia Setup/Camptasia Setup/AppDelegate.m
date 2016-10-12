//
//  AppDelegate.m
//  Camptasia Setup
//
//  Created by Satendra Singh on 08/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import "AppDelegate.h"
#import "CSHomeViewController.h"
#import "CSUtility.h"

@interface AppDelegate ()
{
    CSHomeViewController *homeViewController;
}

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    homeViewController = [[CSHomeViewController alloc] initWithNibName:@"CSHomeViewController" bundle:nil];
    [self.window.contentView addSubview:homeViewController.view];
    [CSUtility addAutoresizingConstraintsToChild:homeViewController.view withParent:_window.contentView];
    NSRect screen = [[NSScreen deepestScreen] frame];
    [self.window setFrame:screen display:YES];
//    [self.window setContentSize:screenSize];
//    [self.window setFrameOrigin:NSZeroPoint];
//    [self.window toggleFullScreen:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
