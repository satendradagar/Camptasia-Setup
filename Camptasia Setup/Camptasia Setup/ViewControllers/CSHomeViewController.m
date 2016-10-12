//
//  CSHomeViewController.m
//  Camptasia Setup
//
//  Created by Satendra Singh on 08/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import "CSHomeViewController.h"
#import "CSComponentsViewController.h"
#import "CSSetupViewController.h"
#import "NSViewController+Navigation.h"

@interface CSHomeViewController ()

-(IBAction)didClickTips:(id)sender;

-(IBAction)didClickRecord:(id)sender;

-(IBAction)didClickExamples:(id)sender;

-(IBAction)didClickContactSupport:(id)sender;

@end

@implementation CSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.acceptsTouchEvents = YES;

    // Do view setup here.
}

-(IBAction)didClickTips:(id)sender{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://www.google.com"]];
}

-(IBAction)didClickRecord:(id)sender{
        //CSSetupViewController
//    CSSetupViewController *componentsController = [[CSSetupViewController alloc] initWithNibName:@"CSSetupViewController" bundle:nil];

    CSComponentsViewController *componentsController = [[CSComponentsViewController alloc] initWithNibName:@"CSComponentsViewController" bundle:nil];
    [self pushViewController:componentsController];
//    [self presentViewControllerAsModalWindow:componentsController];

}

-(IBAction)didClickExamples:(id)sender{

    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://www.youtube.com"]];
   
}

-(IBAction)didClickContactSupport:(id)sender{
    
}


-(IBAction)didClickBack:(id)sender{
    
    [self popViewController];
}


@end
