//
//  CSComponentsViewController.m
//  Camptasia Setup
//
//  Created by Satendra Singh on 08/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import "CSComponentsViewController.h"
#import "CSSetupViewController.h"
#import "NSViewController+Navigation.h"

@interface CSComponentsViewController ()

@end

@implementation CSComponentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

-(IBAction)didClickContinue:(id)sender{
   
    CSSetupViewController *setupController = [[CSSetupViewController alloc] initWithNibName:@"CSSetupViewController" bundle:nil];
    [self pushViewController:setupController];

}


-(IBAction)didClickContactSupport:(id)sender{
    
}


@end
