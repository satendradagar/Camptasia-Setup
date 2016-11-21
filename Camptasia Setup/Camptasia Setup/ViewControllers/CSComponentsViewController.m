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
#import "CSButton.h"
#import "CSAttrributedButton.h"
#import "CSUtility.h"

@interface CSComponentsViewController ()

@property (weak) IBOutlet CSAttrributedButton *continueButton;

@end

@implementation CSComponentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (nil == [[NSUserDefaults standardUserDefaults] objectForKey:(NSString *)defaultsLectureKey]) {
        
        [CSUtility saveValue:YES forKey:defaultsLectureKey];
        [CSUtility saveValue:YES forKey:defaultsPresentationKey];
        [CSUtility saveValue:YES forKey:defaultsLearningKey];

    }
    [_lectureButton setState:[CSUtility valueForKey:defaultsLectureKey]];
    [_presentationButton setState:[CSUtility valueForKey:defaultsPresentationKey]];
    [_learningButton setState:[CSUtility valueForKey:defaultsLearningKey]];
    [self validateContinue];
    // Do view setup here.
}

-(IBAction)didClickContinue:(id)sender{
   
    CSSetupViewController *setupController = [[CSSetupViewController alloc] initWithNibName:@"CSSetupViewController" bundle:nil];
    [self pushViewController:setupController];

}


-(IBAction)didClickContactSupport:(id)sender{
    
}

-(IBAction)didSelectLecture:(CSButton *)sender{
    
    [CSUtility saveValue:sender.state forKey:defaultsLectureKey];
    [self validateContinue];
}

-(IBAction)didSelectPresentation:(CSButton *)sender{
    
    [CSUtility saveValue:sender.state forKey:defaultsPresentationKey];
    [self validateContinue];

}


-(IBAction)didSelectLearning:(CSButton *)sender{
    
    [CSUtility saveValue:sender.state forKey:defaultsLearningKey];
    [self validateContinue];

}

-(void)validateContinue{
    
    BOOL isLecture = [CSUtility valueForKey:defaultsLectureKey];
    BOOL isPresentation = [CSUtility valueForKey:defaultsPresentationKey];
    BOOL isLearning = [CSUtility valueForKey:defaultsLearningKey];
    
    if (isLecture || isPresentation || isLearning) {
        
        [_continueButton setAlphaValue:1.0];
        [_continueButton setEnabled:YES];
    }
    else{
        
        [_continueButton setAlphaValue:0.3];
        [_continueButton setEnabled:NO];
        
    }
}


-(IBAction)didClickBack:(id)sender{
    
    [self popViewController];
}


@end
