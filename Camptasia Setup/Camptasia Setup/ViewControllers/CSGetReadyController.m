//
//  CSGetReadyController.m
//  Camptasia Setup
//
//  Created by Satendra Singh on 09/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import "CSGetReadyController.h"
#import "CSAttrributedButton.h"
#import "NSViewController+Navigation.h"

@interface CSGetReadyController ()

@property (weak) IBOutlet CSAttrributedButton *exitButton;

@property (weak) IBOutlet NSTextField *label;

@end

@implementation CSGetReadyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_exitButton setHidden:YES];
    // Do view setup here.
    [self performSelector:@selector(launchApplication) withObject:nil afterDelay:2];
    [self performSelector:@selector(showExitButton) withObject:nil afterDelay:5];
}

-(void)launchApplication{

        //Applications/Camtasia 2.app/Contents/MacOS/Camtasia 2

    [[NSWorkspace sharedWorkspace] launchApplication:@"/Applications/Camtasia 2.app/Contents/MacOS/Camtasia 2"];

}

-(void)showExitButton{
    _label.stringValue = @"";
    [_exitButton setHidden:NO];

}

-(IBAction)didClickExit:(id)sender{
    
    [NSApp terminate:self];
}


-(IBAction)didClickBack:(id)sender{
    
    [self popViewController];
}


@end

