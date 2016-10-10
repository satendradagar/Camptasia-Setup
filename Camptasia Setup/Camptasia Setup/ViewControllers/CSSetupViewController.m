//
//  CSSetupViewController.m
//  Camptasia Setup
//
//  Created by Satendra Singh on 08/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import "CSSetupViewController.h"
#import "CSCheckboxView.h"
#import "CSGetReadyController.h"
#import "NSViewController+Navigation.h"

@interface CSSetupViewController ()

@property (weak) IBOutlet CSCheckboxView *studioLights;

@property (weak) IBOutlet CSCheckboxView *roomLights;

@property (weak) IBOutlet CSCheckboxView *lapelMicrophone;

@property (weak) IBOutlet CSCheckboxView *presentationLoaded;

@property (weak) IBOutlet CSCheckboxView *learningGlass;

@end

@implementation CSSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.learningGlass configureState:NO];
    // Do view setup here.
}


-(IBAction)didClickContinue:(id)sender{
    
    CSGetReadyController *readyController = [[CSGetReadyController alloc] initWithNibName:@"CSGetReadyController" bundle:nil];
    [self pushViewController:readyController];
    
}

@end
